
<script>
$(document).ready(function(){
    var colsNames = ['id','Empresa_id', 'RazonSocial', 'Ruc', 'Direccion'];
	var colsModel = [
		{ name: 'id', index: 'id', width: 55, hidden: true },
        { name: 'Empresa_id', index: 'Empresa_id', width: 55 },
		{ name: 'RazonSocial', index: 'RazonSocial', sopt: 'like', formatter: function (cellvalue, options, rowObject) {
		    return jqGridCreateLink('mantenimiento/admin/' + rowObject.id, cellvalue);
		}},
        { name: 'Ruc', index: 'Ruc'  },
        { name: 'Direccion', index: 'Direccion'  }

	];

	var grid = jqGridStart('list', 'pager', 'mantenimiento/ajax/CargarAdmin', colsNames, colsModel, '', '');

	grid.jqGrid('filterToolbar', {stringResult: true, searchOnEnter: true});
})
</script>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <a class="btn btn-default pull-right" href="<?php echo base_url('index.php/mantenimiento/admin'); ?>">
                <span class="glyphicon glyphicon-file"></span>
                Nueva Configuraci�n
            </a>
            <h1>Configuraci�n</h1>
        </div>
        <ol class="breadcrumb">
            <li>
                <a href="<?php echo base_url('index.php'); ?>">Inicio</a>
            </li>
            <li class="active">Configuraci�nes</li>
        </ol>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table id="list"></table>
                    <div id="pager"></div>
                </div>
            </div>
        </div>
    </div>
</div>


