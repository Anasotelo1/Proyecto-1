<?php

require_once "Conexion.php";

class Electrodomestico extends Conexion{

  private $accesoBD;

  public function __CONSTRUCT(){
    $this->accesoBD = parent::getConexion();
  }

  public function listado(){
    try{
      $consulta = $this->accesoBD->prepare("CALL spu_electrodomesticos_listar()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrar($datos= []){
    try{

      $consulta = $this->accesoBD->prepare("CALL spu_electrodomesticos_registrar(?, ?, ?, ?, ?, ?, ?, ?)");

      $consulta->execute(
        array(
          $datos["categoria"],
          $datos["nombre"],
          $datos["marca"],
          $datos["precio"],
          $datos["color"],
          $datos["stock"],
          $datos["garantia"],
          $datos["clasificacionenergica"]
        )
        );
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function eliminar($idelectrodomesticos = 0){
    try{
      $consulta = $this->accesoBD->prepare("CALL spu_electrodomesticos_eliminar(?)");
      $consulta->execute(array($idelectrodomesticos));
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

}
