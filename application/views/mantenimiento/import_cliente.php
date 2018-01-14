<?php 
	//array_debug($this->conf);
?>
<div class="row">
	<div class="col-md-12">
		<div class="page-header">
			<h1>Importar Clientes</h1>
		</div>
		<ol class="breadcrumb">
			<li><a href="<?php echo base_url('index.php'); ?>">Inicio</a></li>
			<li><a href="<?php echo base_url('index.php/mantenimiento/clientes'); ?>">Clientes</a></li>
			<li class="active"><?php echo $cliente == null ? "Cargar Cliente" : $cliente->Nombre; ?></li>
		</ol>
		<div class="row">
			<div class="col-md-12">
				
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#ccomprobante" data-toggle="tab">Cargar Clientes</a></li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content">

					<div class="tab-pane active" id="ccomprobante" style="padding-top:15px;">
						<?php echo form_open('mantenimiento/CargarClientes', array('class' => 'upd')); ?>
						<div class="form-group">
							<input name="Boleta" type="file" autocomplete="off" />
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-default submit-ajax-button">Guardar</button>
						</div>
						<?php echo form_close(); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>