<?php
//array_debug($usuario);
?>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1>
                <?php echo $tipocambio == null ? "Nuevo Tipo Cambio" : $tipocambio->Fecha; ?>
            </h1>
        </div>
        <ol class="breadcrumb">
            <li>
                <a href="<?php echo base_url('index.php'); ?>">Inicio</a>
            </li>
            <li>
                <a href="<?php echo base_url('index.php/mantenimiento/tipocambio'); ?>">Tipo Cambio</a>
            </li>
            <li class="active">
                <?php echo $tipocambio == null ? "Nuevo Item" : $tipocambio->Fecha; ?>
            </li>
        </ol>
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">(*) Campos obligatorios</div><?php echo form_open('mantenimiento/tipocambiocrud', array('class' => 'upd')); ?><?php if($tipocambio != null): ?>
                <input type="hidden" name="id" value="<?php echo $tipocambio->id; ?>" /><?php endif; ?>

                 
                    <div class="form-group">
                        <label>Fecha (*)</label>
                        <input autocomplete="off" name="Fecha" type="text" class="form-control required datepicker" placeholder="Fecha" value="<?php echo date(DATE); ?>" maxlenght="10" />
                    </div>
             
                    <div class="form-group">
                        <label>Soles (*)</label>
                        <input autocomplete="off" name="Soles" type="text" class="form-control required" placeholder="Soles" value="<?php echo $tipocambio != null ? $tipocambio->Soles : null; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Dolares (*)</label>
                        <input autocomplete="off" name="Dolares" type="text" class="form-control required" placeholder="Dolares" value="<?php echo $tipocambio != null ? $tipocambio->Dolares : null; ?>" />
                    </div>

                    <div class="clearfix text-right"><?php if(isset($tipocambio)): ?>
                        <button type="button" class="btn btn-danger submit-ajax-button del" value="<?php echo base_url('index.php/mantenimiento/usuarioeliminar/' . $tipocambio->id); ?>">Eliminar</button><?php endif; ?>
                        <button type="submit" class="btn btn-info submit-ajax-button">Guardar</button>
                    </div><?php echo form_close(); ?>
                </div>
            </div>
    </div>
</div>