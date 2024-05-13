use IMDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_filme` (
  `id_filme` INT NOT NULL AUTO_INCREMENT,
  `nome_titulo_filme` VARCHAR(150) NOT NULL,
  `ano_lancamento_filme` VARCHAR(4) NOT NULL,
  `indicado_posicao_ranking_filme` INT NOT NULL,
  `classificacao_indicativa` VARCHAR(45) NOT NULL,
  `duracao` VARCHAR(45) NOT NULL,
  `orcamento` VARCHAR(45) NOT NULL,
  `bilheteria` VARCHAR(45) NOT NULL,
  `slogan` VARCHAR(320) NOT NULL,
  PRIMARY KEY (`id_filme`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_escritores` (
  `id_escritores` INT NOT NULL AUTO_INCREMENT,
  `nome_escritores` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_escritores`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_filme_escritores` (
  `tb_filme_id_filme` INT NOT NULL,
  `tb_escritores_id_escritores` INT NOT NULL,
  PRIMARY KEY (`tb_filme_id_filme`, `tb_escritores_id_escritores`),
  INDEX `fk_tb_filme_has_tb_escritores_tb_escritores1_idx` (`tb_escritores_id_escritores` ASC) VISIBLE,
  INDEX `fk_tb_filme_has_tb_escritores_tb_filme1_idx` (`tb_filme_id_filme` ASC) VISIBLE,
  CONSTRAINT `fk_tb_escritores_filme`
    FOREIGN KEY (`tb_filme_id_filme`)
    REFERENCES `imdb`.`tb_filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_filme_escritores`
    FOREIGN KEY (`tb_escritores_id_escritores`)
    REFERENCES `imdb`.`tb_escritores` (`id_escritores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT,
  `nome_genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_genero`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_filme_genero` (
  `tb_filme_id_filme` INT NOT NULL,
  `tb_genero_id_genero` INT NOT NULL,
  PRIMARY KEY (`tb_filme_id_filme`, `tb_genero_id_genero`),
  INDEX `fk_tb_filme_has_tb_genero_tb_genero1_idx` (`tb_genero_id_genero` ASC) VISIBLE,
  INDEX `fk_tb_filme_has_tb_genero_tb_filme1_idx` (`tb_filme_id_filme` ASC) VISIBLE,
  CONSTRAINT `fk_tb_genero_filme`
    FOREIGN KEY (`tb_filme_id_filme`)
    REFERENCES `imdb`.`tb_filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_filme_genero`
    FOREIGN KEY (`tb_genero_id_genero`)
    REFERENCES `imdb`.`tb_genero` (`id_genero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_elenco` (
  `id_elenco` INT NOT NULL AUTO_INCREMENT,
  `nome_elenco` VARCHAR(350) NOT NULL,
  PRIMARY KEY (`id_elenco`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_filme_elenco` (
  `tb_filme_id_filme` INT NOT NULL,
  `tb_elenco_id_elenco` INT NOT NULL,
  PRIMARY KEY (`tb_filme_id_filme`, `tb_elenco_id_elenco`),
  INDEX `fk_tb_filme_has_tb_elenco_tb_elenco1_idx` (`tb_elenco_id_elenco` ASC) VISIBLE,
  INDEX `fk_tb_filme_has_tb_elenco_tb_filme1_idx` (`tb_filme_id_filme` ASC) VISIBLE,
  CONSTRAINT `fk_tb_elenco_filme`
    FOREIGN KEY (`tb_filme_id_filme`)
    REFERENCES `imdb`.`tb_filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_filme_elenco`
    FOREIGN KEY (`tb_elenco_id_elenco`)
    REFERENCES `imdb`.`tb_elenco` (`id_elenco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_diretor` (
  `id_diretor` INT NOT NULL AUTO_INCREMENT,
  `nome_diretor` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id_diretor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `imdb`.`tb_filme_diretor` (
  `id_filme` INT NOT NULL,
  `id_diretor` INT NOT NULL,
  PRIMARY KEY (`id_filme`, `id_diretor`),
  INDEX `fk_diretor_filme_diretor_idx` (`id_diretor` ASC) VISIBLE,
  CONSTRAINT `fk_filme_filme_diretor`
    FOREIGN KEY (`id_filme`)
    REFERENCES `imdb`.`tb_filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diretor_filme_diretor`
    FOREIGN KEY (`id_diretor`)
    REFERENCES `imdb`.`tb_diretor` (`id_diretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into tb_filme (nome_titulo_filme, ano_lancamento_filme, indicado_posicao_ranking_filme, classificacao_indicativa, duracao, orcamento, bilheteria, slogan) 
select `name`, `year`, `rank`, certificate, run_time, budget, box_office, tagline  from imdb_stage;
select  * from tb_filme;

insert into tb_genero(nome_genero) select genre from imdb_stage;
select  * from tb_genero;

insert into tb_escritores(nome_escritores) select writers from imdb_stage;
select  * from tb_escritores;

insert into tb_diretor(nome_diretor) select directors from imdb_stage;
select  * from tb_diretor;

insert into tb_elenco(nome_elenco) select casts from imdb_stage;
select  * from tb_elenco;