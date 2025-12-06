GRANT ALL PRIVILEGES ON SCHEMA Biblioteca TO admins;

-- Permissões totais no schema PUBLIC
GRANT ALL PRIVILEGES ON SCHEMA public TO admins;


-- Permissões totais em todas as tabelas existentes
GRANT ALL PRIVILEGES ON 
    tb01_leitor,
    tb02_autor,
    tb03_livro,
    tb04_emprestimo,
    tb05_multa
TO admins;

-- Permissão total para futuras tabelas criadas automaticamente
ALTER DEFAULT PRIVILEGES IN SCHEMA Biblioteca
GRANT ALL PRIVILEGES ON TABLES TO admins;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA Biblioteca TO admins;
ALTER DEFAULT PRIVILEGES IN SCHEMA Biblioteca
GRANT ALL PRIVILEGES ON SEQUENCES TO admins;

-- Permissões totais em funções e procedures
GRANT EXECUTE ON PROCEDURE sp_registrar_emprestimo(INT, INT, DATE) TO admins;

GRANT EXECUTE ON FUNCTION fn_trg_registrar_multa() TO admins;
GRANT EXECUTE ON FUNCTION fn_calcular_multa_atraso(INT) TO admins;
