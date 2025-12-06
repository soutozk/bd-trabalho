SET search_path TO "Biblioteca";

-- ======================================================
-- POPULAR TB01_LEITOR
-- ======================================================
INSERT INTO tb01_leitor (nome, email, status)
VALUES
('Arthur Clemente', 'arthur.clemente@mail.com', 'Ativo'),
('Bruna Silva', 'bruna.silva@mail.com', 'Ativo'),
('Carlos Henrique', 'carlos.henrique@mail.com', 'Suspenso'),
('Daniel Souza', 'daniel.souza@mail.com', 'Ativo'),
('Eduarda Lima', 'eduarda.lima@mail.com', 'Ativo'),
('Fernanda Torres', 'fernanda.torres@mail.com', 'Ativo'),
('Gustavo Reis', 'gustavo.reis@mail.com', 'Ativo');

-- ======================================================
-- POPULAR TB02_AUTOR
-- ======================================================
INSERT INTO tb02_autor (nome_autor)
VALUES
('George Orwell'),
('J. K. Rowling'),
('J. R. R. Tolkien'),
('Machado de Assis'),
('Stephen King'),
('Agatha Christie');

-- ======================================================
-- POPULAR TB03_LIVRO
-- ======================================================
INSERT INTO tb03_livro (titulo, id_autor, ano_publicacao, status_livro)
VALUES
('1984', 1, 1949, 'Disponivel'),
('A Revolução dos Bichos', 1, 1945, 'Disponivel'),
('Harry Potter e a Pedra Filosofal', 2, 1997, 'Emprestado'),
('Harry Potter e a Câmara Secreta', 2, 1998, 'Disponivel'),
('O Senhor dos Anéis - A Sociedade do Anel', 3, 1954, 'Emprestado'),
('Dom Casmurro', 4, 1899, 'Disponivel'),
('It: A Coisa', 5, 1986, 'Disponivel'),
('Assassinato no Expresso do Oriente', 6, 1934, 'Disponivel');

-- ======================================================
-- POPULAR TB04_EMPRESTIMO
-- ======================================================
INSERT INTO tb04_emprestimo (id_leitor, id_livro, data_emprestimo, data_prevista, data_devolucao)
VALUES
(1, 3, '2025-04-01', '2025-04-15', NULL),
(2, 5, '2025-03-20', '2025-04-03', '2025-04-02'),
(4, 1, '2025-03-10', '2025-03-24', NULL),
(5, 2, '2025-03-28', '2025-04-11', NULL),
(6, 6, '2025-04-02', '2025-04-16', '2025-04-16'),
(7, 7, '2025-03-15', '2025-03-29', NULL);

-- ======================================================
-- POPULAR TB05_MULTA
-- ======================================================
INSERT INTO tb05_multa (id_emprestimo, valor, motivo)
VALUES
(1, 5.00, 'Atraso de devolução'),
(3, 7.50, 'Atraso de 3 dias'),
(6, 3.00, 'Dano leve no livro'),
(2, 2.50, 'Devolução fora do prazo por 1 dia'),
(4, 4.00, 'Atraso de devolução – 4 dias');

