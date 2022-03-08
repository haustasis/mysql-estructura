-- MySQL Workbench Synchronization
-- Generated: 2022-03-08 14:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: MANDRIL

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `modelOptica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `modelOptica`.`proveidor` (
  `proveidor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `pis` VARCHAR(45) NULL DEFAULT NULL,
  `porta` VARCHAR(45) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(5) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` VARCHAR(15) NULL DEFAULT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `NIF` VARCHAR(15) NULL DEFAULT NULL,
  `marca_marca_id` INT(11) NOT NULL,
  PRIMARY KEY (`proveidor_id`, `marca_marca_id`),
  INDEX `fk_proveidor_marca_idx` (`marca_marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_marca`
    FOREIGN KEY (`marca_marca_id`)
    REFERENCES `modelOptica`.`marca` (`marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelOptica`.`ulleres` (
  `ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `graduacio_dreta` DOUBLE NULL DEFAULT NULL,
  `graduacio_esquerra` DOUBLE NULL DEFAULT NULL,
  `muntura_tipus` VARCHAR(45) NULL DEFAULT NULL,
  `muntura_color` VARCHAR(45) NULL DEFAULT NULL,
  `vidre_dret_color` VARCHAR(45) NULL DEFAULT NULL,
  `vidre_esquerra_color` VARCHAR(45) NULL DEFAULT NULL,
  `preu` DOUBLE NULL DEFAULT NULL,
  `data_venda` DATETIME NULL DEFAULT NULL,
  `empleat_empleat_id` INT(11) NOT NULL,
  `client_client_id` INT(11) NOT NULL,
  `marca_marca_id` INT(11) NOT NULL,
  PRIMARY KEY (`ulleres_id`, `empleat_empleat_id`, `client_client_id`, `marca_marca_id`),
  INDEX `fk_ulleres_empleat1_idx` (`empleat_empleat_id` ASC) VISIBLE,
  INDEX `fk_ulleres_client1_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_ulleres_marca1_idx` (`marca_marca_id` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_empleat1`
    FOREIGN KEY (`empleat_empleat_id`)
    REFERENCES `modelOptica`.`empleat` (`empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `modelOptica`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`marca_marca_id`)
    REFERENCES `modelOptica`.`marca` (`marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelOptica`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `adreça` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `data_registre` DATETIME NULL DEFAULT NULL,
  `client_id_recomenat` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`, `client_id_recomenat`),
  INDEX `fk_client_id_recomentat_idx` (`client_id_recomenat` ASC) INVISIBLE,
  CONSTRAINT `fk_client_client1`
    FOREIGN KEY (`client_id_recomenat`)
    REFERENCES `modelOptica`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelOptica`.`empleat` (
  `empleat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`empleat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelOptica`.`marca` (
  `marca_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`marca_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
