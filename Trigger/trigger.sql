CREATE OR REPLACE FUNCTION fn_trg_registrar_multa()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_multa NUMERIC(10,2);
BEGIN
    -- Só funciona quando a devolução foi registrada agora
    IF NEW.data_devolucao IS NOT NULL AND OLD.data_devolucao IS NULL THEN

        -- Calcula a multa usando a função criada antes
        v_multa := fn_calcular_multa_atraso(NEW.id_emprestimo);

        -- Insere a multa se houver atraso
        IF v_multa > 0 THEN
            INSERT INTO tb05_multa (id_emprestimo, valor, motivo)
            VALUES (NEW.id_emprestimo, v_multa, 'Atraso na devolução');
        END IF;

        -- Atualiza status do livro automaticamente
        UPDATE tb03_livro
        SET status_livro = 'Disponivel'
        WHERE id_livro = NEW.id_livro;

    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_registrar_multa
AFTER UPDATE ON tb04_emprestimo
FOR EACH ROW
EXECUTE FUNCTION fn_trg_registrar_multa();
