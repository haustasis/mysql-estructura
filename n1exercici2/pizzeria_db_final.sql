-- MySQL Workbench Synchronization
-- Generated: 2022-03-26 11:18
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: MANDRIL

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria_final` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`tienda` (
  `tienda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `codipo_postal` VARCHAR(45) NULL DEFAULT NULL,
  `localidad_localidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`tienda_id`),
  INDEX `fk_tienda_localidad1_idx` (`localidad_localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_tienda_localidad1`
    FOREIGN KEY (`localidad_localidad_id`)
    REFERENCES `pizzeria_final`.`localidad` (`localidad_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`localidad` (
  `localidad_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `provincia_provincia_id` INT(11) NOT NULL,
  PRIMARY KEY (`localidad_id`),
  INDEX `fk_localidad_provincia_idx` (`provincia_provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia`
    FOREIGN KEY (`provincia_provincia_id`)
    REFERENCES `pizzeria_final`.`provincia` (`provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`provincia` (
  `provincia_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`cliente` (
  `cliente_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `localidad_localidad_id` INT(11) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `fk_cliente_localidad1_idx` (`localidad_localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`localidad_localidad_id`)
    REFERENCES `pizzeria_final`.`localidad` (`localidad_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`empleado` (
  `empleado_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `empleado_funcion` VARCHAR(45) NULL DEFAULT NULL,
  `tienda_tienda_id` INT(11) NOT NULL,
  PRIMARY KEY (`empleado_id`),
  INDEX `fk_empleado_tienda1_idx` (`tienda_tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_tienda1`
    FOREIGN KEY (`tienda_tienda_id`)
    REFERENCES `pizzeria_final`.`tienda` (`tienda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`producto` (
  `producto_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(450) NULL DEFAULT NULL,
  `imagen` BLOB NULL DEFAULT NULL,
  `precio` DOUBLE NULL DEFAULT NULL,
  `producto_tipo_producto_tipo_id` INT(11) NOT NULL,
  PRIMARY KEY (`producto_id`),
  INDEX `fk_producto_producto_tipo1_idx` (`producto_tipo_producto_tipo_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_producto_tipo1`
    FOREIGN KEY (`producto_tipo_producto_tipo_id`)
    REFERENCES `pizzeria_final`.`producto_tipo` (`producto_tipo_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`pedido` (
  `pedido_id` INT(11) NOT NULL AUTO_INCREMENT,
  `pedido_fecha` DATETIME NULL DEFAULT NULL,
  `pedido_entrega` DATETIME NULL DEFAULT NULL,
  `pedido_tipo_entrega` VARCHAR(45) NULL DEFAULT NULL,
  `producto_cantidad` INT(11) NULL DEFAULT NULL,
  `precio_total` DOUBLE NULL DEFAULT NULL,
  `empleado_empleado_id` INT(11) NOT NULL,
  `producto_producto_id` INT(11) NOT NULL,
  `cliente_cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`pedido_id`),
  INDEX `fk_pedido_empleado1_idx` (`empleado_empleado_id` ASC) VISIBLE,
  INDEX `fk_pedido_producto1_idx` (`producto_producto_id` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_empleado1`
    FOREIGN KEY (`empleado_empleado_id`)
    REFERENCES `pizzeria_final`.`empleado` (`empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_producto1`
    FOREIGN KEY (`producto_producto_id`)
    REFERENCES `pizzeria_final`.`producto` (`producto_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_cliente_id`)
    REFERENCES `pizzeria_final`.`cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`producto_tipo` (
  `producto_tipo_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`producto_tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_final`.`producto_pizza_categoria` (
  `producto_pizza_categoria_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `producto_tipo_producto_tipo_id` INT(11) NOT NULL,
  PRIMARY KEY (`producto_pizza_categoria_id`),
  INDEX `fk_producto_pizza_categoria_producto_tipo1_idx` (`producto_tipo_producto_tipo_id` ASC) VISIBLE,
  CONSTRAINT `fk_producto_pizza_categoria_producto_tipo1`
    FOREIGN KEY (`producto_tipo_producto_tipo_id`)
    REFERENCES `pizzeria_final`.`producto_tipo` (`producto_tipo_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
