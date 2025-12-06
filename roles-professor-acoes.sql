--Permissões do PROFESSOR
-- Regras:
-- - NÃO pode alterar estrutura do BD (sem ALTER, CREATE, DROP)
-- - SELECT em todas as tabelas
-- - INSERT e UPDATE nas tabelas principais
-- - SEM permissão de DELETE
-- - EXECUTE em funções e procedimentos

-- Remove permissões no schema biblioteca
REVOKE ALL ON SCHEMA biblioteca FROM professor;
REVOKE CREATE ON SCHEMA biblioteca FROM professor;

-- Bloquea também no schema PUBLIC
REVOKE CREATE ON SCHEMA public FROM professor;

-- Permitir apenas acesso de uso ao schema correto
GRANT USAGE ON SCHEMA biblioteca TO professor;


-- SELECT em TODAS as tabelas
GRANT SELECT ON 
   tb01_leitor,
    tb02_autor,
    tb03_livro,
    tb04_emprestimo,
    tb05_multa
TO professor;

-- INSERT e UPDATE nas tabelas principais
GRANT INSERT, UPDATE ON 
   tb01_leitor,
    tb02_autor,
    tb03_livro,
    tb04_emprestimo,
    tb05_multa
TO professor;

-- NEGANDO DELETE explicitamente
REVOKE DELETE ON 
    tb01_leitor,
    tb02_autor,
    tb03_livro,
    tb04_emprestimo,
    tb05_multa
FROM professor;

-- Permissão geral para todas as funções e procedures no schema
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA biblioteca TO professor;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA biblioteca TO professor;
GRANT EXECUTE ON PROCEDURE sp_registrar_emprestimo(INT, INT, DATE) TO professor;
GRANT EXECUTE ON FUNCTION fn_trg_registrar_multa() TO professor;
GRANT EXECUTE ON FUNCTION fn_calcular_multa_atraso(INT) TO professor;
