<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Http\Response as Response;
use Phalcon\Mvc\Controller;

class UsuariosController extends Controller
{

    public function indexAction()
    {
        $usuarios = Usuarios::find(['order' => 'id DESC']);
        $this->view->usuarios = $usuarios;
    }

    public function busquedaAction()
    {
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Usuarios", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        }

        $parameters = array();

        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }
        $usuario = Usuarios::find($parameters);
        $this->view->usuarios = $usuario;
    }

    public function guardarAction()
    {
    	$this->view->disable();

    	$res = new Response;

    	$id = $this->request->getPost("id");

    	if ($id == '') {

	    	$create = new Usuarios();

	    	$create->assign(array(
	    		'nombre'    => $this->request->getPost('nombre'),
	    		'usuario'   => $this->request->getPost('usuario'),
	    		'correo'    => $this->request->getPost('correo')
	    	));

	    	$action = $create->save();

	    } else {

	    	$usuario = Usuarios::findFirst($id);

            $usuario->id        = $id;
            $usuario->nombre    = $this->request->getPost("nombre");
            $usuario->usuario   = $this->request->getPost("usuario");
            $usuario->correo    = $this->request->getPost("correo");

	   		$action = $usuario->save();
	    }

   		if (! $action) {
			$return = array('return' => false, 'msg' => 'Error guardando');
		} else {
			$return = array('return' => true);
		}

    	$res->setContent(json_encode( $return ));

   		return $res;
    }

    public function borrarAction()
    {
        $this->view->disable();

        $res = new Response;

        $id = $this->request->getPost('id');
        $usuario = Usuarios::findFirst($id);

        if (!$usuario->delete()) {
            $return = array('return' => false, 'msg' => 'Error al borrar');
        } else {
            $return = array('return' => true);
        }

        $res->setContent(json_encode($return));

        return $res;
    }
}

