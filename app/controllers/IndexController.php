<?php

class IndexController extends ControllerBase
{
    public function indexAction()
    {
	  	$usuarios = Usuarios::find(['order' => 'id DESC']);
    	$this->view->usuarios = $usuarios;
    }
}

