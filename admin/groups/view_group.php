<?php
require_once('../../config.php');
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM `group_list` where id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
    }
}
?>
<style>
    #uni_modal .modal-footer{
        display:none !important;
    }
</style>
<div class="container-fluid">
    <dl>
        <dt class="text-muted">Адреса</dt>
        <dd class='pl-4 fs-4 fw-bold'><?= isset($name) ? $name : '' ?></dd>
        <dt class="text-muted">Розміри</dt>
        <dd class='pl-4'>
            <p class=""><small><?= isset($description) ? ($description) : '' ?></small></p>
        </dd>
        <dt class="text-muted">Тип власника</dt>
        <dd class='pl-4'>
            <p class=""><?= isset($type) ? ($type == 1 ? 'Персональна' : 'Підприємець') : 'N/A' ?></p>
        </dd>
        <dt class="text-muted">Статус</dt>
        <dd class='pl-4 fs-4 fw-bold'>
            <?php 
            $status = isset($status) ? $status : 0;
                switch($status){
                    case 0:
                        echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Не використовується</span>';
                        break;
                    case 1:
                        echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Використовується</span>';
                        break;
                    default:
                        echo '<span class="badge badge-default border px-3 rounded-pill">N/A</span>';
                            break;
                }
            ?>
        </dd>
    </dl>
    <div class="col-12 text-right">
        <button class="btn btn-flat btn-sm btn-dark" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Закрити</button>
    </div>
</div>