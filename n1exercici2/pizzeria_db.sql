-- MySQL Workbench Synchronization
-- Generated: 2022-03-08 14:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: MANDRIL

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cognom` VARCHAR(45) NULL DEFAULT NULL,
  `direccio` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(45) NULL DEFAULT NULL,
  `localitat_localitat_id` INT(11) NOT NULL,
  `provincia_provincia_id` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`, `localitat_localitat_id`, `provincia_provincia_id`),
  INDEX `fk_client_localitat_idx` (`localitat_localitat_id` ASC) VISIBLE,
  INDEX `fk_client_provincia1_idx` (`provincia_provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_localitat`
    FOREIGN KEY (`localitat_localitat_id`)
    REFERENCES `pizzeria`.`localitat` (`localitat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client_provincia1`
    FOREIGN KEY (`provincia_provincia_id`)
    REFERENCES `pizzeria`.`provincia` (`provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`localitat` (
  `localitat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`localitat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `provincia_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`pizza` (
  `pizza_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` VARCHAR(45) NULL DEFAULT NULL,
  `preu` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`pizza_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`hamburguesa` (
  `hamburguesa_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` VARCHAR(45) NULL DEFAULT NULL,
  `preu` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`hamburguesa_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`beguda` (
  `beguda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `imatge` VARCHAR(45) NULL DEFAULT NULL,
  `preu` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`beguda_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `comanda_id` INT(11) NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `comanda_repartiment` VARCHAR(45) NULL DEFAULT NULL,
  `comanda_recollida` VARCHAR(45) NULL DEFAULT NULL,
  `quantitat_productes` INT(11) NULL DEFAULT NULL,
  `preu_total` DOUBLE NULL DEFAULT NULL,
  `client_client_id` INT(11) NOT NULL,
  `pizza_pizza_id` INT(11) NOT NULL,
  `beguda_beguda_id` INT(11) NOT NULL,
  `hamburguesa_hamburguesa_id` INT(11) NOT NULL,
  `empleat_empleat_id` INT(11) NOT NULL,
  `botiga_botiga_id` INT(11) NOT NULL,
  PRIMARY KEY (`comanda_id`, `client_client_id`, `pizza_pizza_id`, `beguda_beguda_id`, `hamburguesa_hamburguesa_id`, `empleat_empleat_id`, `botiga_botiga_id`),
  INDEX `fk_comanda_client1_idx` (`client_client_id` ASC) VISIBLE,
  INDEX `fk_comanda_pizza1_idx` (`pizza_pizza_id` ASC) VISIBLE,
  INDEX `fk_comanda_beguda1_idx` (`beguda_beguda_id` ASC) VISIBLE,
  INDEX `fk_comanda_hamburguesa1_idx` (`hamburguesa_hamburguesa_id` ASC) VISIBLE,
  INDEX `fk_comanda_empleat1_idx` (`empleat_empleat_id` ASC) VISIBLE,
  INDEX `fk_comanda_botiga1_idx` (`botiga_botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_client1`
    FOREIGN KEY (`client_client_id`)
    REFERENCES `pizzeria`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_pizza1`
    FOREIGN KEY (`pizza_pizza_id`)
    REFERENCES `pizzeria`.`pizza` (`pizza_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_beguda1`
    FOREIGN KEY (`beguda_beguda_id`)
    REFERENCES `pizzeria`.`beguda` (`beguda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_hamburguesa1`
    FOREIGN KEY (`hamburguesa_hamburguesa_id`)
    REFERENCES `pizzeria`.`hamburguesa` (`hamburguesa_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_empleat1`
    FOREIGN KEY (`empleat_empleat_id`)
    REFERENCES `pizzeria`.`empleat` (`empleat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_botiga_id`)
    REFERENCES `pizzeria`.`botiga` (`botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `botiga_id` INT(11) NOT NULL AUTO_INCREMENT,
  `direccio` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(45) NULL DEFAULT NULL,
  `localitat` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`botiga_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleat` (
  `empleat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `cognoms` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(45) NULL DEFAULT NULL,
  `tipus_empleat` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`empleat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
