<?php
//array_debug($usuario);
?>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1>
                <?php echo $serie == null ? "Nuevo Serie" : $serie->serie; ?>
            </h1>
        </div>
        <ol class="breadcrumb">
            <li>
                <a href="<?php echo base_url('index.php'); ?>">Inicio</a>
            </li>
            <li>
                <a href="<?php echo base_url('index.php/mantenimiento/serie'); ?>">Serie</a>
            </li>
            <li class="active">
                <?php echo $serie == null ? "Nuevo Item" : $serie->serie; ?>
            </li>
        </ol>
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">(*) Campos obligatorios</div><?php echo form_open('mantenimiento/seriecrud', array('class' => 'upd')); ?><?php if($serie != null): ?>
                <input type="hidden" name="id" value="<?php echo $serie->id; ?>" /><?php endif; ?>

                 
           
             
                    <div class="form-group">
                        <label>Tipo Documento (*)</label>
                        <input autocomplete="off" name="tipodoc" type="text" class="form-control required" placeholder="tipodoc" value="<?php echo $serie != null ? $serie->tipodoc : null; ?>" />
                    </div>

                    <div class="form-group">
                        <label>Serie (*)</label>
                        <input autocomplete="off" name="serie" type="text" class="form-control required" placeholder="serie" value="<?php echo $serie != null ? $serie->serie : null; ?>" />
                    </div>

                    <div class="form-group">
                        <label>correlativo (*)</label>
                        <input autocomplete="off" name="correlativo" type="text" class="form-control required" placeholder="correlativo" value="<?php echo $serie != null ? $serie->correlativo : null; ?>" />
                    </div>
                    <div class="clearfix text-right"><?php if(isset($serie)): ?>
                        <button type="button" class="btn btn-danger submit-ajax-button del" value="<?php echo base_url('index.php/mantenimiento/serieeliminar/' . $serie->id); ?>">Eliminar</button><?php endif; ?>
                        <button type="submit" class="btn btn-info submit-ajax-button">Guardar</button>
                    </div><?php echo form_close(); ?>
                </div>
            </div>
    </div>
</div>