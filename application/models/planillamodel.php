<?php
class PlanillaModel extends CI_Model
{	
	public function Planilla()
	{
		$this->db->order_by('Nombre');
		return $this->db->get('planilla')->result();
	}
}