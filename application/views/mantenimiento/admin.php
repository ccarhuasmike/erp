<?php
//array_debug($this->conf);
?>
<div class="row">
    <div class="col-md-12">
        <div class="page-header">
            <h1>Configuración</h1>
        </div>
        <ol class="breadcrumb">
            <li>
                <a href="<?php echo base_url('index.php'); ?>">Inicio</a>
            </li>
            <li class="active">Configuración</li>
        </ol>
        <div class="row">
            <div class="col-md-12">

                <div class="well well-sm">(*) Campos obligatorios</div>
                <div class="tab-content">

                    <?php echo form_open('mantenimiento/adminactualizar', array('class' => 'upd')); ?>
                    <div class="form-group">
                        <label>Empresa (*)</label>
                        <input autocomplete="off" name="RazonSocial" type="text" class="form-control" placeholder="Nombre de la empresa" value="<?php echo $admin != null ?$this->admin->RazonSocial : null; ?>" />
                    </div>
                    <div class="form-group">
                        <label>RUC (*)</label>
                        <input maxlength="11" autocomplete="off" name="Ruc" type="text" class="form-control required" placeholder="Número de RUC" value="<?php echo $admin != null ?$this->admin->Ruc : null; ?>" />
                    </div>          
                    <div class="form-group">
                        <label>Planilla (*)</label>
                        <?php echo Select('planilla', $planilla, 'Nombre', 'Value'); ?>
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