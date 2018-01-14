<?php
class SerieModel extends CI_Model
{

	public function Listar()
	{
        $where = 'Empresa_id = ' . $this->user->Empresa_id;
		$this->filter = isset($_REQUEST['filters']) ? json_decode($_REQUEST['filters']) : null;

		$this->db->where($where);
		if($this->filter != null)
		{
			foreach($this->filter->{'rules'} as $f)
			{
				if($f->field == 'serie') $where .= " AND serie = '" . $f->data . "' ";
                if($f->field == 'correlativo') $where .= " AND correlativo = '" . $f->data . "' ";

			}
		}

		$this->db->where($where);
		$this->jqgridmodel->Config($this->db->SELECT('COUNT(*) Total FROM serie')->get()->row()->Total);

		$this->db->order_by($this->jqgridmodel->sord);
		$this->db->where($where);
		$this->jqgridmodel->DataSource(
			$this->db->get(
				'serie',
				$this->jqgridmodel->limit,
				$this->jqgridmodel->start)->result());



		return $this->jqgridmodel;
	}

    public function Actualizar($data)
	{

		$this->db->where('Empresa_id', $this->user->Empresa_id);
		$this->db->where('id', $data['id']);
		$this->db->update('serie', $data);

		$this->responsemodel->SetResponse(true);
        return $this->responsemodel;
	}
	public function Registrar($data)
	{
		$data['Empresa_id'] = $this->user->Empresa_id;

		$this->db->insert('serie', $data);

		$this->responsemodel->SetResponse(true);
		$this->responsemodel->href   = 'mantenimiento/serie/' . $this->db->insert_id();

		return $this->responsemodel;
	}
	public function Obtener($id)
	{
		$this->db->where('Empresa_id', $this->user->Empresa_id);
		$this->db->where('id', $id);
		return $this->db->get('serie')->row();
	}
}