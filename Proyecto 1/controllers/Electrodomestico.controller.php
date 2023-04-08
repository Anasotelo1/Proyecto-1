<?php

require_once '../models/Electrodomestico.php';

if (isset($_POST['operacion'])){
  
  $electrodomestico = new Electrodomestico();

  if ($_POST['operacion']=='listado'){

    $datosObtenidos = $electrodomestico->listado();

    if ($datosObtenidos){
        $numeroFila = 1;
        foreach($datosObtenidos as $electrodomestico){
          echo "
          <tr>
            <td>$numeroFila</td>
            <td>{$electrodomestico['categoria']}</td>
            <td>{$electrodomestico['nombre']}</td>
            <td>{$electrodomestico['marca']}</td>
            <td>{$electrodomestico['precio']}</td>
            <td>{$electrodomestico['color']}</td>
            <td>{$electrodomestico['stock']}</td>
            <td>{$electrodomestico['garantia']}</td>
            <td>{$electrodomestico['clasificacionenergica']}</td>
            <td>
                <a href='#' data-idelectrodomesticos='{$electrodomestico['idelectrodomesticos']}'class='btn btn-sm btn-primary'><i class='bi bi-pencil'></i></a>         
                <a href='#' data-idelectrodomesticos='{$electrodomestico['idelectrodomesticos']}'class=' eliminar btn btn-sm btn-danger'><i class='bi bi-trash'></i></a>
            </td>
          </tr>
          ";
          $numeroFila++;
      }
    }
  }


  if($_POST['operacion']=='registrar'){

    $datosForm = [
        "categoria"               => $_POST['categoria'],
        "nombre"                  => $_POST['nombre'],
        "marca"                   => $_POST['marca'],
        "precio"                  => $_POST['precio'],
        "color"                   => $_POST['color'],
        "stock"                   => $_POST['stock'],
        "garantia"                => $_POST['garantia'],
        "clasificacionenergica"   => $_POST['clasificacionenergica']
    ];
    $electrodomestico->registrar($datosForm);
  }

  if ($_POST['operacion'] == 'eliminar'){
    $electrodomestico->eliminar($_POST['idelectrodomesticos']);
  }

}
