-- ======================================================
-- FUNÇÃO: Calcula multa de atraso baseada em um empréstimo
-- ======================================================
SET search_path = "Biblioteca";
CREATE OR REPLACE FUNCTION fn_calcular_multa_atraso(p_id_emprestimo INT)
RETURNS NUMERIC(10,2)
LANGUAGE plpgsql
AS $$
DECLARE
    v_data_prevista   DATE;
    v_data_devolucao  DATE;
    v_dias_atraso     INT;
    v_multa           NUMERIC(10,2);
BEGIN
    -- Buscar informações do empréstimo
    SELECT data_prevista, data_devolucao
    INTO v_data_prevista, v_data_devolucao
    FROM tb04_emprestimo
    WHERE id_emprestimo = p_id_emprestimo;

    -- Se o empréstimo não existir
    IF NOT FOUND THEN
        RETURN NULL;
    END IF;

    -- Se ainda não foi devolvido, considerar a data atual
    IF v_data_devolucao IS NULL THEN
        v_data_devolucao := CURRENT_DATE;
    END IF;

    -- Calcular atraso
    v_dias_atraso := (v_data_devolucao - v_data_prevista);

    -- Sem atraso (dias negativos viram zero)
    IF v_dias_atraso <= 0 THEN
        RETURN 0;
    END IF;

    -- Valor de multa: R$ 1,00 por dia (pode mudar depois)
    v_multa := v_dias_atraso * 1.00;

    RETURN v_multa;
END;
$$;
