use IMDB;
describe imdb_stage;

CREATE TABLE IF NOT EXISTS `IMDB`.`filmes` (
  `ID_IMDB` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(100) NULL DEFAULT NULL,
  `Ano` INT NULL DEFAULT NULL,
  `Avaliacao` DOUBLE NULL DEFAULT NULL,
  `Class_indi` VARCHAR(45) NULL DEFAULT NULL,
  `Duracao` VARCHAR(45) NULL DEFAULT NULL,
  `Slogan` VARCHAR(350) NULL DEFAULT NULL,
  `Orcamento` VARCHAR(45) NULL,
  `Faturamento` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_IMDB`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `IMDB`.`profissionais` (
  `ID_Profissionais` INT NOT NULL auto_increment,
  `ID_IMDB` INT NOT NULL,
  `Elenco` VARCHAR(350) NULL DEFAULT NULL,
  `Diretores` VARCHAR(100) NULL DEFAULT NULL,
  `Escritores` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Profissionais`),
  INDEX `ID_imdb_idx` (`ID_IMDB` ASC) VISIBLE,
  CONSTRAINT `ID_imdb`
    FOREIGN KEY (`ID_IMDB`)
    REFERENCES `IMDB`.`filmes` (`ID_IMDB`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS `IMDB`.`generos` (
  `idgenero` INT NOT NULL auto_increment,
=======
CREATE TABLE IF NOT EXISTS `IMDB`.`genero` (
  `idgenero` INT NOT NULL,
>>>>>>> 2f3775a1609395ac63ad6dc191711368ef761062
  `id_imdb` INT NOT NULL,
  `genero` VARCHAR(100) NULL,
  PRIMARY KEY (`idgenero`),
  INDEX `id_imdb_idx` (`id_imdb` ASC) VISIBLE,
  CONSTRAINT `id_imdb_`
    FOREIGN KEY (`id_imdb`)
    REFERENCES `IMDB`.`filmes` (`ID_IMDB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
<<<<<<< HEAD
ENGINE = InnoDB;

INSERT INTO filmes (Titulo, Ano, Avaliacao, Class_indi, Duracao, Slogan, Orcamento, Faturamento)
SELECT `name`, `year`, rating, certificate, run_time, tagline, budget, box_office
FROM imdb_stage;

INSERT INTO genero (genero)
SELECT genre
FROM imdb_stage;

INSERT INTO genero (id_imdb)
SELECT ID_IMDB
FROM filmes;

UPDATE genero g
JOIN imdb_stage i ON g.genero = i.genre
JOIN filmes f ON f.id_IMDB = g.id_imdb
SET g.id_imdb = f.id_IMDB;

INSERT INTO profissionais (Elenco, Diretores, Escritores)
SELECT casts, directors, writers
FROM imdb_stage;

INSERT INTO profissionais (ID_IMDB)
SELECT ID_IMDB
FROM filmes;

INSERT INTO generos (id_imdb)
SELECT ID_IMDB
FROM filmes;

select id_imdb from generos;

=======
ENGINE = InnoDB;
>>>>>>> 2f3775a1609395ac63ad6dc191711368ef761062
