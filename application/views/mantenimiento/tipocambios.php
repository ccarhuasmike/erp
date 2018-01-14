<script>
$(document).ready(function(){
    var colsNames = ['id', 'Fecha', 'Soles', 'Dolares'];
	var colsModel = [ 
		{name:  'id',index:'id', width:55, hidden: true},
		{
        name: 'Fecha', index: 'Fecha', sopt: 'like', formatter: function (cellvalue, options, rowObject) {
            return jqGridCreateLink('mantenimiento/tipocambio/' + rowObject.id, cellvalue);
        }
        },
		{name:  'Soles', index:'Soles', width: 30, search: false },
		{name:  'Dolares', index: 'Dolares', width: 30, search: false }
	];	
		
	var grid = jqGridStart('list', 'pager', 'mantenimiento/ajax/Cargartipocambios', colsNames, colsModel, '', '');

	grid.jqGrid('filterToolbar', {stringResult: true, searchOnEnter: true});
})
</script>
<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<a class="btn btn-default pull-right" href="<?php echo base_url('index.php/mantenimiento/tipocambio'); ?>">
				<span class="glyphicon glyphicon-file"></span>
				Nuevo Tipo Cambio
			</a>
			<h1>Tipo Cambio</h1>
		</div>
		<ol class="breadcrumb">
		  <li><a href="<?php echo base_url('index.php'); ?>">Inicio</a></li>
		  <li class="active">Tipo Cambio</li>
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

