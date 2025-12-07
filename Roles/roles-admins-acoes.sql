GRANT ALL PRIVILEGES ON SCHEMA Biblioteca TO admins;

-- Permissões totais no schema PUBLIC
GRANT ALL PRIVILEGES ON SCHEMA public TO admins;


-- Permissões totais em todas as tabelas existentes
GRANT ALL PRIVILEGES ON 
    biblioteca.tb01_leitor,
    biblioteca.tb02_autor,
    biblioteca.tb03_livro,
    biblioteca.tb04_emprestimo,
    biblioteca.tb05_multa
TO admins;

-- Permissão total para futuras tabelas criadas automaticamente
ALTER DEFAULT PRIVILEGES IN SCHEMA biblioteca
GRANT ALL PRIVILEGES ON TABLES TO admins;

GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA biblioteca TO admins;
ALTER DEFAULT PRIVILEGES IN SCHEMA biblioteca
GRANT ALL PRIVILEGES ON SEQUENCES TO admins;

-- Permissões totais em funções e procedures
GRANT EXECUTE ON PROCEDURE biblioteca.sp_registrar_emprestimo(INT, INT, DATE) TO admins;

GRANT EXECUTE ON FUNCTION biblioteca.fn_trg_registrar_multa() TO admins;
GRANT EXECUTE ON FUNCTION biblioteca.fn_calcular_multa_atraso(INT) TO admins;
