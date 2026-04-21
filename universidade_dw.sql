CREATE DATABASE universidade_dw;
USE universidade_dw;

-- DIMENSÃO: PROFESSOR
CREATE TABLE dim_professor (
    id_professor INT PRIMARY KEY,
    departamento_id INT,
    nome VARCHAR(100),
    titulacao VARCHAR(50),
    sexo CHAR(1),
    data_contratacao DATE
);

-- DIMENSÃO: DEPARTAMENTO
CREATE TABLE dim_departamento (
    id_departamento INT PRIMARY KEY,
    nome VARCHAR(100),
    campus VARCHAR(100),
    id_professor_coordenador INT
);

-- DIMENSÃO: CURSO
CREATE TABLE dim_curso (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    nivel VARCHAR(50),
    id_departamento INT
);

-- DIMENSÃO: DISCIPLINA
CREATE TABLE dim_disciplina (
    id_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(100),
    carga_horaria INT,
    id_professor INT
);

-- DIMENSÃO: TEMPO
CREATE TABLE dim_tempo (
    id_tempo INT PRIMARY KEY,
    data_completa DATE,
    dia INT,
    mes INT,
    ano INT,
    semestre INT,
    trimestre INT
);

-- TABELA FATO
CREATE TABLE fato_professor (
    id_fato INT AUTO_INCREMENT PRIMARY KEY,

    id_professor INT,
    id_disciplina INT,
    id_curso INT,
    id_departamento INT,
    id_tempo INT,

    -- MÉTRICAS
    carga_horaria INT,
    qtd_disciplinas INT,
    tempo_experiencia INT,

    -- FOREIGN KEYS
    FOREIGN KEY (id_professor) REFERENCES dim_professor(id_professor),
    FOREIGN KEY (id_disciplina) REFERENCES dim_disciplina(id_disciplina),
    FOREIGN KEY (id_curso) REFERENCES dim_curso(id_curso),
    FOREIGN KEY (id_departamento) REFERENCES dim_departamento(id_departamento),
    FOREIGN KEY (id_tempo) REFERENCES dim_tempo(id_tempo)
);