<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mantenimiento extends CI_Controller
{
	public function __CONSTRUCT()
	{
		parent::__construct();
		$this->load->model('clientemodel', 'clm');
		$this->load->model('monedamodel', 'mm');
		$this->load->model('productomodel', 'pm');
		$this->load->model('serviciomodel', 'sm');
		$this->load->model('usuariomodel', 'um');
		$this->load->model('tipocambiomodel', 'tcm');
		$this->load->model('seriemodel', 'srm');
		$this->load->model('comprobantemodel', 'cpm');
		$this->load->model('configuracionmodel', 'cfm');
		$this->load->model('adminmodel', 'adm');
		$this->load->model('planillamodel', 'planm');
	}

	public function administrador()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');

		$this->load->view('header');
		$this->load->view('mantenimiento/administrador');
		$this->load->view('footer');
	}
	public function admin($id=0)
	{
		$u = $id > 0 ? $this->adm->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/admin',
			array(
				'admin' => $u,
				'planilla'   => $this->planm->Planilla()
			));
		$this->load->view('footer');
	}
	public function admincrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		if(IS_DEMO == 1)
		{
			print_r(json_encode(array('response' => false, 'message' => 'La <b>versión DEMO</b> no permite guardar los datos de los Usuarios.')));
		} else {
			print_r(json_encode( isset($_POST['id']) ? $this->adm->Actualizar(SafeRequestParameters($_POST)) : $this->adm->Registrar(SafeRequestParameters($_POST))) );
		}
	}
	public function admineliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		print_r(json_encode($this->adm->Eliminar($id)));
	}

	public function series()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');
		if(!$this->menumodel->VerificarTipo()) redirect('inicio');
		$this->load->view('header');
		$this->load->view('mantenimiento/series');
		$this->load->view('footer');
	}
	public function serie($id=0)
	{
		$srm = $id > 0 ? $this->srm->Obtener($id) : null;
		$this->load->view('header');
		$this->load->view('mantenimiento/serie',
			array(
				'serie' => $srm
			));
		$this->load->view('footer');
	}
	public function seriecrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		if(IS_DEMO == 1)
		{
			print_r(json_encode(array('response' => false, 'message' => 'La <b>versión DEMO</b> no permite guardar los datos de los Usuarios.')));
		} else {
			print_r(json_encode( isset($_POST['id']) ? $this->srm->Actualizar(SafeRequestParameters($_POST)) : $this->srm->Registrar(SafeRequestParameters($_POST))) );
		}
	}
	public function serieeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		print_r(json_encode($this->srm->Eliminar($id)));
	}

	public function tipocambios()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');
		if(!$this->menumodel->VerificarTipo()) redirect('inicio');
		$this->load->view('header');
		$this->load->view('mantenimiento/tipocambios');
		$this->load->view('footer');
	}
	public function tipocambio($id=0)
	{
		$tcm = $id > 0 ? $this->tcm->Obtener($id) : null;
		$this->load->view('header');
		$this->load->view('mantenimiento/tipocambio',
			array(
				'tipocambio' => $tcm
			));
		$this->load->view('footer');
	}
	public function tipocambiocrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		if(IS_DEMO == 1)
		{
			print_r(json_encode(array('response' => false, 'message' => 'La <b>versión DEMO</b> no permite guardar los datos de los Usuarios.')));
		} else {
			print_r(json_encode( isset($_POST['id']) ? $this->tcm->Actualizar(SafeRequestParameters($_POST)) : $this->tcm->Registrar(SafeRequestParameters($_POST))) );
		}
	}
	public function tipocambioeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		print_r(json_encode($this->tcm->Eliminar($id)));
	}

	public function usuarios()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');
		if(!$this->menumodel->VerificarTipo()) redirect('inicio');
		$this->load->view('header');
		$this->load->view('mantenimiento/usuarios');
		$this->load->view('footer');
	}
	public function usuario($id=0)
	{
		$u = $id > 0 ? $this->um->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/usuario',
			array(
				'usuario' => $u,
				'tipos'   => $this->um->Tipos()
			));
		$this->load->view('footer');
	}
	public function usuariocrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		if(IS_DEMO == 1)
		{
			print_r(json_encode(array('response' => false, 'message' => 'La <b>versión DEMO</b> no permite guardar los datos de los Usuarios.')));
		} else {
			print_r(json_encode( isset($_POST['id']) ? $this->um->Actualizar(SafeRequestParameters($_POST)) : $this->um->Registrar(SafeRequestParameters($_POST))) );
		}
	}
	public function usuarioeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');

		print_r(json_encode($this->um->Eliminar($id)));
	}

	//Segundo Mike  I
	public function import_cliente($id=0)
	{
		$c = $id > 0 ? $this->clm->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/import_cliente',
			array(
				'cliente' => $c
			));
		$this->load->view('footer');
	}
	//Segundo Mike  F
	public function clientes()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');

		$this->load->view('header');
		$this->load->view('mantenimiento/clientes');
		$this->load->view('footer');
	}
	public function cliente($id=0)
	{
		$c = $id > 0 ? $this->clm->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/cliente',
			array(
				'cliente' => $c
			));
		$this->load->view('footer');
	}
	public function clientecrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode(isset($_POST['id']) ? $this->clm->Actualizar(SafeRequestParameters($_POST)) : $this->clm->Registrar(SafeRequestParameters($_POST))));
	}
	public function clienteeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode($this->clm->Eliminar($id)));
	}
	public function productos()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');

		$this->load->view('header');
		$this->load->view('mantenimiento/productos');
		$this->load->view('footer');
	}
	public function producto($id=0)
	{
		$p = $id > 0 ? $this->pm->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/producto',
			array(
				'producto' => $p,
				'asignada' => $id > 0 ? $this->pm->HaSidoAsignada($id) : false
			)
		);
		$this->load->view('footer');
	}
	public function productocrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode(isset($_POST['id']) ? $this->pm->Actualizar(SafeRequestParameters($_POST)) : $this->pm->Registrar(SafeRequestParameters($_POST))));
	}
	public function productoeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode($this->pm->Eliminar($id)));
	}
	public function servicios()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');

		$this->load->view('header');
		$this->load->view('mantenimiento/servicios');
		$this->load->view('footer');
	}
	public function servicio($id=0)
	{
		$s = $id > 0 ? $this->sm->Obtener($id) : null;

		$this->load->view('header');
		$this->load->view('mantenimiento/servicio',
			array(
				'servicio' => $s
			));
		$this->load->view('footer');
	}
	public function serviciocrud()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode(isset($_POST['id']) ? $this->sm->Actualizar(SafeRequestParameters($_POST)) : $this->sm->Registrar(SafeRequestParameters($_POST))));
	}
	public function servicioeliminar($id)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode($this->sm->Eliminar($id)));
	}
	public function impresora($tipo)
	{
		$this->load->library('EnLetras', 'el');
		$this->load->view('ventas/impresion', array(
			'comprobante' => $this->cpm->ObtenerPrueba($tipo),
			'EnLetras'    => new EnLetras()
		));
	}
	public function configuracion()
	{
		// Verificamos si tiene permiso
		if(!$this->menumodel->VerificarAcceso()) redirect('inicio');

		$this->load->view('header');
		$this->load->view('mantenimiento/configuracion',
			array(
				'configuracion' => $this->configuracionmodel->Obtener(),
				'monedas'       => $this->mm->Listar()
			));
		$this->load->view('footer');
	}
	public function ConfiguracionActualizar()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		print_r(json_encode($this->configuracionmodel->Actualizar(SafeRequestParameters($_POST))));
	}
	public function CargarClientes()
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		//print_r(json_encode($this->configuracionmodel->CargaClienteMasiva(SafeRequestParameters($_POST))));
		

		print_r(json_encode($this->clm->cargarClientes($_FILES)));
	}

	public function Ajax($action)
	{
		if (!$this->input->is_ajax_request()) exit('No direct script access allowed');
		// Productos
		switch($action)
		{
			case 'CargarUsuarios':
			print_r(json_encode($this->um->Listar()));
			break;
			case 'CargarSerie':
			print_r(json_encode($this->srm->Listar()));
			break;
			case 'Cargartipocambios':
			print_r(json_encode($this->tcm->Listar()));
			break;
			case 'CargarProductos':
			print_r(json_encode($this->pm->Listar()));
			break;
			case 'CargarClientes':
			print_r(json_encode($this->clm->Listar()));
			break;
			case 'CargarServicios':
			print_r(json_encode($this->sm->Listar()));
			break;
			case 'GuardarConfiguracionImpresora':
			print_r(json_encode($this->cfm->GuardarConfiguracionImpresora($this->input->post('f'), $this->input->post('tipo'))));
			break;
		}
	}
}