<script>
$(document).ready(function(){
	var colsNames = ['id','tipodoc', 'serie', 'correlativo'];
	var colsModel = [ 
		{ name: 'id', index: 'id', width: 55, hidden: true },
        { name: 'tipodoc', index: 'tipodoc', width: 55, hidden: true },
		{name: 'serie', index: 'serie', sopt: 'like', formatter: function (cellvalue, options, rowObject) {
		        return jqGridCreateLink('mantenimiento/Serie/' + rowObject.id, cellvalue);
		    }
		},
		{ name: 'correlativo', index: 'correlativo', width: 30 } 
	];	
		
	var grid = jqGridStart('list', 'pager', 'mantenimiento/ajax/CargarSerie', colsNames, colsModel, '', '' );

	grid.jqGrid('filterToolbar', {stringResult: true, searchOnEnter: true});
})
</script>
<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<a class="btn btn-default pull-right" href="<?php echo base_url('index.php/mantenimiento/serie'); ?>">
				<span class="glyphicon glyphicon-file"></span>
				Nuevo Serie
			</a>
			<h1>Series</h1>
		</div>
		<ol class="breadcrumb">
		  <li><a href="<?php echo base_url('index.php'); ?>">Inicio</a></li>
		  <li class="active">Serie</li>
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

