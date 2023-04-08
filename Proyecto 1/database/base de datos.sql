CREATE DATABASE TiendaElectrodomestica;
USE TiendaElectrodomestica;

CREATE TABLE electrodomesticos
(
   idelectrodomesticos		INT AUTO_INCREMENT PRIMARY KEY,
   categoria     		VARCHAR(70) 	NOT NULL,
   nombre			VARCHAR(50) 	NOT NULL,
   marca 			VARCHAR(50) 	NOT NULL,
   precio 			DECIMAL(7,2) 	NOT NULL,
   color 			VARCHAR(20) 	NOT NULL,
   stock                        CHAR(5)      	NOT NULL,
   garantia                     VARCHAR(20) 	NOT NULL,
   clasificacionenergica	VARCHAR(50)	NOT NULL,  
   fechafabricacion             DATETIME 	NOT NULL DEFAULT NOW(),
   fechaupdate                  DATETIME 	NULL,
   estado 			CHAR(1) 	NOT NULL DEFAULT '1' 
 )ENGINE = INNODB;


 INSERT INTO electrodomesticos(categoria,nombre,marca,precio,color,stock,garantia,clasificacionenergica) VALUES
 ('Electrodomesticos del Hogar', 'Plancha', 'Oster', 120, 'negro', '20', '1 Año','PAE' ),
 ('Electrodomesticos de Lavado', 'Lavadora', 'Mabe', 1500, 'gris', '5', '2 Años', 'Linea Blanca' ),
 ('Electrodomesticos de Cocina', 'Horno Microondas', 'Samsung', 500,'negro', '10','6 Meses', 'Linea Blanca'),
 ('Electrodomesticos de Limpieza', 'Aspiradora', 'Imaco',800, 'gris', '5', '1 Año','PAE' ),
 ('Electrodomesticos del Hogar', 'Televisor', 'Sony',3000, 'negro', '30', '5 Años','Linea Marron' );
 

 
-- Procedimiento para listar electrodomesticos
DELIMITER $$
CREATE PROCEDURE spu_electrodomesticos_listar()
BEGIN 
    SELECT idelectrodomesticos,
           categoria,
           nombre,
           marca,
           precio,
           color,
           stock,
           garantia,
          clasificacionenergica
    FROM electrodomesticos
    WHERE estado = '1'
    ORDER BY idelectrodomesticos DESC; 
 END $$ 
 
 CALL spu_electrodomesticos_listar();
 
 
 -- Procedimiento para registrar electrodomesticos
 DELIMITER $$
 CREATE PROCEDURE spu_electrodomesticos_registrar
 (
         IN _categoria 			VARCHAR(70),
         IN _nombre    			VARCHAR(50),
	 IN _marca 			VARCHAR(50),
         IN _precio 			DECIMAL(7,2),
	 IN _color 			VARCHAR(20),
	 IN _stock              	CHAR(5),
	 IN _garantia           	VARCHAR(20),
	 IN _clasificacionenergica	VARCHAR(50)  
 )
 BEGIN 
      INSERT INTO electrodomesticos(categoria, nombre, marca, precio, color, stock, garantia, clasificacionenergica)
      VALUES (_categoria, _nombre, _marca, _precio, _color, _stock, _garantia, _clasificacionenergica);
 END $$
 
 CALL spu_electrodomesticos_registrar('Electrodomesticos de Hogar','Refrigerador','Indurama',2600,'Blanco','7','5 Años','Linea Blanca');
 
 
 -- Procedimiento para eliminar electrodomesticos
 DELIMITER $$
 CREATE PROCEDURE spu_electrodomesticos_eliminar(IN _idelectrodomesticos INT)
 BEGIN 
	UPDATE electrodomesticos
	SET estado = '0'
	WHERE idelectrodomesticos = _idelectrodomesticos;
END $$ 

CALL spu_electrodomesticos_eliminar(5);


 
          
 