<?php

namespace CsnUser\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Db\TableGateway\TableGateway;
use Zend\Authentication\Result;
use CsnUser\Form\UserFilter;
use CsnUser\Form\UserForm;

class UserController extends AbstractActionController
{
	private $usersTable;
	//CRUD
	//retrieve
	
	public function indexAction()
	{
		
		return new ViewModel(array('rowset' => $this->getUserTable()->select()));
	}
	
	//Create 
	
	public function createAction()
	{
		$form = new UserForm();
		$request = $this->getRequest();
		if($request->isPost()){
			$form->setInputFilter(new UserFilter());
			$form->setData($request->getPost());
			if($form->isValid()){
				$data = $form->getData();
				unset($data['submit']);
				if(empty($data['usr_registration_date'])) $data['usr_registration_date'] = '2014-12-24 12:00:00';
				$this->getUserTable()->insert($data);
				return $this->redirect()->toRoute('csn_user/default', array('controller' => 'user', 'action' => 'index' )); 
			}
		}
		
		return new ViewModel(array('form' => $form ));
	}
	
	//Upate
	
	public function updateAction()
	{
		$id = $this->params()->fromRoute('id');
		if(!$id)
			return $this->redirect()->toRoute('csn_user/default', array('controller' => 'user', 'action' => 'index'));
		$form = new UserForm();
		$request = $this->getRequest();
		if($request->isPost()){
			$form->setInputFilter(new UserFilter());
			$form->setData($request->getPost());
			if($form->isValid()){
				$data = $form->getData();
				unset($data['submit']);
				if(empty($data['usr_registration_date'])) $data['usr_registration_date'] = '2014-12-24 12:00:00';
				$this->getUserTable()->update($data,array('usr_id' => $id));
				return $this->redirect()->toRoute('csn_user/default', array('controller' => 'user', 'action' => 'index'));
			}
		} else {
			$form->setData($this->getUserTable()->select(array('usr_id' => $id))->current());
		}	
		return new ViewModel(array('form' => $form, 'id' =>$id));
	}
	
	//Delete
	
	public function deleteAction()
	{
		$id = $this->params()->fromRoute('id');
		if($id){
			$this->getUserTable()->delete(array('usr_id' =>$id));
		}
		
		return $this->redirect()->toRoute('csn_user/default', array('controller' => 'user', 'action' => 'index'));
		//return new ViewModel();
	}
	
	//instanse ont object from tableGateway
	public function getUserTable()
	{
		if(!$this->usersTable){
			$this->usersTable = new TableGateway(
					'users',
					$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter')
				//	new \Zend\Db\TableGateway\Feature\RowGatewayFeature('usr_id')
				//	ResultSetPrototype
					);
		}
		
		return $this->usersTable;
	}

	
}