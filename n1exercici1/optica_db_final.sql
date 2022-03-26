-- MySQL Workbench Synchronization
-- Generated: 2022-03-26 10:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: MANDRIL

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optica_schema` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica_schema`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cognom` VARCHAR(45) NULL DEFAULT NULL,
  `data_registre` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`recomanat` (
  `recomanat_id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`recomanat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`client_dades` (
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`gafa` (
  `gafa_id` INT(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL DEFAULT NULL,
  `graduacion_izquierda` DOUBLE NULL DEFAULT NULL,
  `graduacion_derecha` DOUBLE NULL DEFAULT NULL,
  `montura_tipo` VARCHAR(45) NULL DEFAULT NULL,
  `montura_color` VARCHAR(45) NULL DEFAULT NULL,
  `cristal_color_izquierda` VARCHAR(45) NULL DEFAULT NULL,
  `cristal_color_derecha` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  `proveedor_proveedor_id` INT(11) NOT NULL,
  PRIMARY KEY (`gafa_id`),
  INDEX `fk_gafa_proveedor1_idx` (`proveedor_proveedor_id` ASC) VISIBLE,
  CONSTRAINT `fk_gafa_proveedor1`
    FOREIGN KEY (`proveedor_proveedor_id`)
    REFERENCES `optica_schema`.`proveedor` (`proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`proveedor` (
  `proveedor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_calle` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_numero` INT(11) NULL DEFAULT NULL,
  `direccion_puerta` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_codigo_postal` VARCHAR(45) NULL DEFAULT NULL,
  `direccion_pais` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`cliente` (
  `cliente_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_registro` DATETIME NULL DEFAULT NULL,
  `recomendado_clliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cliente_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`pedido` (
  `pedido_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pedido_fecha` VARCHAR(45) NULL DEFAULT NULL,
  `empleado_empleado_id` INT(11) NOT NULL,
  `gafa_gafa_id` INT(11) NOT NULL,
  `cliente_cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`pedido_id`),
  INDEX `fk_pedido_empleado_idx` (`empleado_empleado_id` ASC) VISIBLE,
  INDEX `fk_pedido_gafa1_idx` (`gafa_gafa_id` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_empleado`
    FOREIGN KEY (`empleado_empleado_id`)
    REFERENCES `optica_schema`.`empleado` (`empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_gafa1`
    FOREIGN KEY (`gafa_gafa_id`)
    REFERENCES `optica_schema`.`gafa` (`gafa_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_cliente_id`)
    REFERENCES `optica_schema`.`cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica_schema`.`empleado` (
  `empleado_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
