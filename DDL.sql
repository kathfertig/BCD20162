USE bcd;
DROP TABLE IF EXISTS matricula;
DROP TABLE IF EXISTS curso;
DROP TABLE IF EXISTS disciplina;
DROP TABLE IF EXISTS curriculo;
DROP TABLE IF EXISTS aluno;
DROP TABLE IF EXISTS campus;
DROP DATABASE IF EXISTS bcd;

CREATE DATABASE IF NOT EXISTS bcd;
USE bcd;

CREATE TABLE IF NOT EXISTS campus(
    id  tinyint unsigned auto_increment primary key,
    nome varchar(128) unique not null
);

CREATE TABLE  IF NOT EXISTS aluno(
    id int unsigned auto_increment primary key,
    nome varchar(128) not null,
    documento char(11) unique not null,
    telefone bigint unsigned,
    email varchar(128)
);

CREATE TABLE IF NOT EXISTS disciplina(

    id smallint unsigned auto_increment primary key,

    codigo char(8) unique not null,

    nome char(100) not null,

    CH tinyint unsigned not null,

    CHmin smallint unsigned not null

);

CREATE TABLE IF NOT EXISTS curso(
    id smallint unsigned auto_increment primary key,
    numero smallint unsigned unique not null,
    CHmin smallint unsigned not null,
    CHmax smallint unsigned not null,
    nome varchar(128) not null,
    campus tinyint unsigned  not null,
    constraint fk_curso_campus_campus_id foreign key(campus) references campus(id)    
);

CREATE TABLE IF NOT EXISTS curriculo(
    id smallint unsigned auto_increment primary key,
   curso smallint unsigned not null,
    implantacao date not null,
    disciplina smallint unsigned not null,
    constraint fk_curriculo_disciplina_disciplina_id foreign key(disciplina) references disciplina(id),
    constraint fk_curriculo_curso_curso_id foreign key(curso) references curso(id)
);


CREATE TABLE IF NOT EXISTS matricula(
    id  int unsigned auto_increment primary key,
    numero bigint unsigned unique not null,
    aluno int unsigned  not null,
    curso smallint unsigned not null,
    constraint fk_matricula_aluno_aluno_id foreign key(aluno) references aluno(id),
    constraint fk_matricula_curso_curso_id foreign key(curso) references curso(id)
);
