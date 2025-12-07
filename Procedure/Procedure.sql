SET search_path = biblioteca;
CREATE OR REPLACE PROCEDURE biblioteca.sp_registrar_emprestimo(
    p_id_leitor INT,
    p_id_livro INT,
    p_data_prevista DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_status_leitor   VARCHAR(20);
    v_status_livro    VARCHAR(20);
BEGIN
    -- Início da transação implícita do bloco
    -- Buscar status do leitor
    SELECT status INTO v_status_leitor
    FROM tb01_leitor
    WHERE id_leitor = p_id_leitor;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Leitor % não existe.', p_id_leitor;
    END IF;

    IF v_status_leitor = 'Suspenso' THEN
        RAISE EXCEPTION 'Leitor % está suspenso e não pode pegar livros.', p_id_leitor;
    END IF;

    -- Buscar status do livro
    SELECT status_livro INTO v_status_livro
    FROM tb03_livro
    WHERE id_livro = p_id_livro;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Livro % não existe.', p_id_livro;
    END IF;

    IF v_status_livro <> 'Disponivel' THEN
        RAISE EXCEPTION 'Livro % não está disponível para empréstimo.', p_id_livro;
    END IF;

    -- Inserir o empréstimo
    INSERT INTO tb04_emprestimo (id_leitor, id_livro, data_emprestimo, data_prevista)
    VALUES (p_id_leitor, p_id_livro, CURRENT_DATE, p_data_prevista);

    -- Atualizar status do livro
    UPDATE tb03_livro
    SET status_livro = 'Emprestado'
    WHERE id_livro = p_id_livro;

    -- Se tudo deu certo:
    RAISE NOTICE 'Empréstimo registrado com sucesso para o leitor %.', p_id_leitor;

EXCEPTION
    WHEN OTHERS THEN
        -- QUALQUER erro desfaz todas as operações
        RAISE EXCEPTION 'Erro ao registrar empréstimo: %', SQLERRM;
END;
$$;
