-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema nuevaverapaz
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nuevaverapaz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nuevaverapaz` DEFAULT CHARACTER SET utf8 ;
USE `nuevaverapaz` ;

-- -----------------------------------------------------
-- Table `nuevaverapaz`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`usuarios` (
  `username` VARCHAR(50) NOT NULL,
  `userpass` VARCHAR(50) NULL DEFAULT NULL,
  `enabled` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`autoridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`autoridad` (
  `username` VARCHAR(50) NOT NULL,
  `autoridad` VARCHAR(50) NOT NULL,
  INDEX `fk_autoridad_usuarios1_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `fk_autoridad_usuarios1`
    FOREIGN KEY (`username`)
    REFERENCES `nuevaverapaz`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`bancos` (
  `idbancos` INT(11) NOT NULL,
  `nombrebanco` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idbancos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`bitacora` (
  `usuario` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `tabla` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATETIME NULL DEFAULT CURRENT_TIMESTAMP)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`cuentas` (
  `idcuentas` INT(11) NOT NULL,
  `nombrecuenta` VARCHAR(45) NULL DEFAULT NULL,
  `saldo` DOUBLE NULL DEFAULT NULL,
  `fechacreacion` DATE NULL DEFAULT NULL,
  `idbanco` INT(11) NOT NULL,
  PRIMARY KEY (`idcuentas`),
  INDEX `fk_cuentas_bancos1_idx` (`idbanco` ASC) VISIBLE,
  CONSTRAINT `fk_cuentas_bancos1`
    FOREIGN KEY (`idbanco`)
    REFERENCES `nuevaverapaz`.`bancos` (`idbancos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`chequeras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`chequeras` (
  `idchequeras` INT(11) NOT NULL,
  `idcuenta` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idchequeras`),
  INDEX `fk_chequeras_cuentas1_idx` (`idcuenta` ASC) VISIBLE,
  CONSTRAINT `fk_chequeras_cuentas1`
    FOREIGN KEY (`idcuenta`)
    REFERENCES `nuevaverapaz`.`cuentas` (`idcuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nuevaverapaz`.`cheques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nuevaverapaz`.`cheques` (
  `idcheques` INT(11) NOT NULL AUTO_INCREMENT,
  `importe` DOUBLE NULL DEFAULT NULL,
  `estado` VARCHAR(20) NULL DEFAULT NULL,
  `usuarios_username` VARCHAR(50) NOT NULL,
  `chequeras_idchequeras` INT(11) NOT NULL,
  PRIMARY KEY (`idcheques`),
  INDEX `fk_cheques_usuarios1_idx` (`usuarios_username` ASC) VISIBLE,
  INDEX `fk_cheques_chequeras1_idx` (`chequeras_idchequeras` ASC) VISIBLE,
  CONSTRAINT `fk_cheques_chequeras1`
    FOREIGN KEY (`chequeras_idchequeras`)
    REFERENCES `nuevaverapaz`.`chequeras` (`idchequeras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cheques_usuarios1`
    FOREIGN KEY (`usuarios_username`)
    REFERENCES `nuevaverapaz`.`usuarios` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

USE `nuevaverapaz` ;

-- -----------------------------------------------------
-- procedure LiberarCheque
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LiberarCheque`(in idx int, estadox varchar(20))
begin
    update cheques set estado=estadox where idcheques=idx;
     end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure actualizarb
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarb`(in idx int, nombreb varchar(45), decripcionb varchar(45))
begin
    update bacos set nombrebanco=nombreb, descipcion=descripcionb where idbancos=idx;
     end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure actualizarchequeras
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarchequeras`(in idx int, idcuenta int, descripcion varchar(45))
begin
    update chequeras set idcuenta=idcuenta, descripcion=descripcion where idchequeras=idx;
     end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure actualizarcuentas
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarcuentas`(in idx int, nombrex varchar(45), saldo double,fechac date, idbanco int)
begin
    update bacos set nombrecuenta=nombrex, saldo=saldo, fechacreacion=fechac, idbanco=idbanco where idbancos=idx;
     end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure borrarb
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarb`(in idx int)
begin
     delete from bancos where idbancos=idx;
    end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure borrarchequera
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarchequera`(in idx int)
begin
     delete from chequeras where idchequeras=idx;
    end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure borrarcuentas
-- -----------------------------------------------------

DELIMITER $$
USE `nuevaverapaz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarcuentas`(in idx int)
begin
     delete from cuentas where idcuentas=idx;
    end$$

DELIMITER ;
USE `nuevaverapaz`;

DELIMITER $$
USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_actualizacion`
BEFORE UPDATE ON `nuevaverapaz`.`bancos`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco actualizado","Bancos",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_eliminacion`
BEFORE DELETE ON `nuevaverapaz`.`bancos`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco eliminado","Bancos",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_insercion`
BEFORE INSERT ON `nuevaverapaz`.`bancos`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Banco creado","Bancos",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_actualizacionc`
BEFORE UPDATE ON `nuevaverapaz`.`cuentas`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta actualizada","Cuentas",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_eliminacionc`
BEFORE DELETE ON `nuevaverapaz`.`cuentas`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta Eliminada","Cuentas",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_insercionc`
BEFORE INSERT ON `nuevaverapaz`.`cuentas`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cuenta creada","Cuentas",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_actualizacionch`
BEFORE UPDATE ON `nuevaverapaz`.`chequeras`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera actualizada","Chequeras",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_eliminacionch`
BEFORE DELETE ON `nuevaverapaz`.`chequeras`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera eliminada","Chequeras",now());$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_insercionch`
BEFORE INSERT ON `nuevaverapaz`.`chequeras`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Chequera creada","Chequeras",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_actualizacionchq`
BEFORE UPDATE ON `nuevaverapaz`.`cheques`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque actualizado","Cheques",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_eliminacionchq`
BEFORE DELETE ON `nuevaverapaz`.`cheques`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque eliminado","Cheques",now())$$

USE `nuevaverapaz`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `nuevaverapaz`.`tr_insercionchq`
BEFORE INSERT ON `nuevaverapaz`.`cheques`
FOR EACH ROW
insert into bitacora(usuario,descripcion,tabla, fecha) values (user(),"Cheque creado","Cheques",now())$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
