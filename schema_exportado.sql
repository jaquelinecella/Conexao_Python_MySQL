-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Faculdade_Nova_Geração
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Faculdade_Nova_Geração
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Faculdade_Nova_Geração` DEFAULT CHARACTER SET utf8 ;
USE `Faculdade_Nova_Geração` ;

-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`cursos` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  `data_inicio` DATE NOT NULL,
  `quant_semestres` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`alunos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`alunos` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`alunos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `rua_numero` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(15) NOT NULL,
  `cep` VARCHAR(20) NOT NULL,
  `municipio` VARCHAR(80) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`vendedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`vendedores` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`vendedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`disciplinas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`disciplinas` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`disciplinas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `dias_da_semana` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`contatos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`contatos` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`contatos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `rua_numero` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(15) NOT NULL,
  `cep` VARCHAR(20) NOT NULL,
  `municipio` VARCHAR(80) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`clientes_potenciais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`clientes_potenciais` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`clientes_potenciais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cursos_id` INT NOT NULL,
  `contatos_id` INT NOT NULL,
  INDEX `fk_cursos_has_contatos_contatos1_idx` (`contatos_id` ASC) ,
  INDEX `fk_cursos_has_contatos_cursos1_idx` (`cursos_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cursos_has_contatos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_contatos_contatos1`
    FOREIGN KEY (`contatos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`contatos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`matriculas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`matriculas` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`matriculas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `alunos_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  `data_matricula` DATE NOT NULL,
  `status_matricula` VARCHAR(45) NOT NULL,
  `numero_matricula` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alunos_has_cursos_cursos1_idx` (`cursos_id` ASC) ,
  INDEX `fk_alunos_has_cursos_alunos1_idx` (`alunos_id` ASC) ,
  CONSTRAINT `fk_alunos_has_cursos_alunos1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`alunos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alunos_has_cursos_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`comissoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`comissoes` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`comissoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cursos_id` INT NOT NULL,
  `vendedores_id` INT NOT NULL,
  `valor_comissao` DECIMAL(8,2) NOT NULL,
  `quant_cursos_vendidos` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cursos_has_vendedores_vendedores1_idx` (`vendedores_id` ASC) ,
  INDEX `fk_cursos_has_vendedores_cursos1_idx` (`cursos_id` ASC) ,
  CONSTRAINT `fk_cursos_has_vendedores_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_vendedores_vendedores1`
    FOREIGN KEY (`vendedores_id`)
    REFERENCES `Faculdade_Nova_Geração`.`vendedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`tipos_bolsa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`tipos_bolsa` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`tipos_bolsa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome_bolsa` VARCHAR(45) NULL,
  `desconto` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`cursos_valores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`cursos_valores` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`cursos_valores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cursos_id` INT NOT NULL,
  `disciplinas_id` INT NOT NULL,
  `quantidade_disc_matriculadas` INT NOT NULL,
  `preco_disciplina` DECIMAL(8,2) NOT NULL,
  INDEX `fk_cursos_has_disciplinas_disciplinas1_idx` (`disciplinas_id` ASC) ,
  INDEX `fk_cursos_has_disciplinas_cursos1_idx` (`cursos_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cursos_has_disciplinas_cursos1`
    FOREIGN KEY (`cursos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_has_disciplinas_disciplinas1`
    FOREIGN KEY (`disciplinas_id`)
    REFERENCES `Faculdade_Nova_Geração`.`disciplinas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Faculdade_Nova_Geração`.`bolsa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Faculdade_Nova_Geração`.`bolsa` ;

CREATE TABLE IF NOT EXISTS `Faculdade_Nova_Geração`.`bolsa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipos_bolsa_id` INT NOT NULL,
  `alunos_id` INT NOT NULL,
  `quantidade` INT NULL,
  INDEX `fk_tipos_bolsa_has_alunos_alunos1_idx` (`alunos_id` ASC) ,
  INDEX `fk_tipos_bolsa_has_alunos_tipos_bolsa1_idx` (`tipos_bolsa_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tipos_bolsa_has_alunos_tipos_bolsa1`
    FOREIGN KEY (`tipos_bolsa_id`)
    REFERENCES `Faculdade_Nova_Geração`.`tipos_bolsa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipos_bolsa_has_alunos_alunos1`
    FOREIGN KEY (`alunos_id`)
    REFERENCES `Faculdade_Nova_Geração`.`alunos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
