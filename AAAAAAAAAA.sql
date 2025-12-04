SET search_path = Biblioteca;

-- ======================================================
-- 1. TABELA: TB01_LEITOR
-- ======================================================
CREATE TABLE tb01_leitor (
    id_leitor        SERIAL PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    email            VARCHAR(120) UNIQUE NOT NULL,
    status           VARCHAR(20) NOT NULL CHECK (status IN ('Ativo', 'Suspenso')),
    data_cadastro    DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ======================================================
-- 2. TABELA: TB02_AUTOR
-- ======================================================
CREATE TABLE tb02_autor (
    id_autor       SERIAL PRIMARY KEY,
    nome_autor     VARCHAR(100) NOT NULL
);

-- ======================================================
-- 3. TABELA: TB03_LIVRO
-- ======================================================
CREATE TABLE tb03_livro (
    id_livro         SERIAL PRIMARY KEY,
    titulo           VARCHAR(150) NOT NULL,
    id_autor         INT NOT NULL,
    ano_publicacao   INT CHECK (ano_publicacao >= 1500 
                                AND ano_publicacao <= EXTRACT(YEAR FROM CURRENT_DATE)),
    status_livro     VARCHAR(20) NOT NULL CHECK (status_livro IN ('Disponivel', 'Emprestado', 'Reservado')),

    CONSTRAINT fk_livro_autor
        FOREIGN KEY (id_autor) 
        REFERENCES tb02_autor (id_autor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ======================================================
-- 4. TABELA: TB04_EMPRESTIMO
-- ======================================================
CREATE TABLE tb04_emprestimo (
    id_emprestimo     SERIAL PRIMARY KEY,
    id_leitor         INT NOT NULL,
    id_livro          INT NOT NULL,
    data_emprestimo   DATE NOT NULL DEFAULT CURRENT_DATE,
    data_prevista     DATE NOT NULL,
    data_devolucao    DATE,

    CONSTRAINT fk_emp_leitor
        FOREIGN KEY (id_leitor)
        REFERENCES tb01_leitor (id_leitor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_emp_livro
        FOREIGN KEY (id_livro)
        REFERENCES tb03_livro (id_livro)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ======================================================
-- 5. TABELA: TB05_MULTA
-- ======================================================
CREATE TABLE tb05_multa (
    id_multa        SERIAL PRIMARY KEY,
    id_emprestimo   INT NOT NULL,
    valor           NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    motivo          VARCHAR(200) NOT NULL,
    data_registro   DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_multa_emprestimo
        FOREIGN KEY (id_emprestimo)
        REFERENCES tb04_emprestimo (id_emprestimo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
