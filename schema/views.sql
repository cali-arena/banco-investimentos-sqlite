-- 1. ✅ Total de investidores cadastrados


SELECT COUNT(*) AS total_investidores FROM Investidores;

-- 2. ✅ Valor total de aportes realizados (toda a base)


SELECT SUM(valor) AS total_aportes
FROM Transacoes
WHERE tipo_transacao = 'Depósito';

-- ✅ Total de rendimento gerado por todos os investimentos

SELECT SUM(valor) AS total_rendimentos
FROM Transacoes
WHERE tipo_transacao = 'Rendimento';

-- 4. ✅ Saldo atual de cada carteira (usando lógica de movimentação)

SELECT 
    c.nome_carteira,
    i.nome AS investidor,
    SUM(CASE 
            WHEN t.tipo_transacao IN ('Depósito', 'Rendimento') THEN t.valor
            WHEN t.tipo_transacao IN ('Saque', 'Compra') THEN -t.valor
            ELSE 0
        END) AS saldo_calculado
FROM Carteiras c
JOIN Investidores i ON c.cpf_investidor = i.cpf
LEFT JOIN Transacoes t ON t.id_carteira = c.id_carteira
GROUP BY c.id_carteira;


-- ✅ Top 5 investidores com maior saldo atual

SELECT 
    i.nome AS investidor,
    SUM(CASE 
            WHEN t.tipo_transacao IN ('Depósito', 'Rendimento') THEN t.valor
            WHEN t.tipo_transacao IN ('Saque', 'Compra') THEN -t.valor
            ELSE 0
        END) AS saldo
FROM Carteiras c
JOIN Investidores i ON c.cpf_investidor = i.cpf
JOIN Transacoes t ON t.id_carteira = c.id_carteira
GROUP BY i.cpf
ORDER BY saldo DESC
LIMIT 5;

-- 6. ✅ Total investido por tipo de investimento (CDB, Ações, etc.)

SELECT ti.nome AS tipo_investimento, SUM(inv.valor_investido) AS total
FROM Investimentos inv
JOIN Tipos_Investimento ti ON inv.id_tipo_investimento = ti.id_tipo_investimento
GROUP BY ti.nome;


-- 7. ✅ Investimentos com vencimento nos próximos 30 dias

SELECT 
    i.nome AS investidor,
    inv.valor_investido,
    inv.data_vencimento,
    julianday(inv.data_vencimento) - julianday('now') AS dias_restantes
FROM Investimentos inv
JOIN Carteiras c ON inv.id_carteira = c.id_carteira
JOIN Investidores i ON c.cpf_investidor = i.cpf
WHERE inv.data_vencimento IS NOT NULL
  AND inv.data_vencimento <= date('now', '+30 days');
  
---8. ✅ Rentabilidade estimada por investimento

SELECT 
    inv.id_investimento,
    i.nome AS investidor,
    inv.valor_investido,
    inv.rentabilidade_esperada,
    ROUND(inv.valor_investido * (inv.rentabilidade_esperada / 100), 2) AS rendimento_estimado
FROM Investimentos inv
JOIN Carteiras c ON inv.id_carteira = c.id_carteira
JOIN Investidores i ON c.cpf_investidor = i.cpf;

-- 9. ✅ Distribuição dos investimentos por nível de risco

SELECT 
    ti.risco,
    COUNT(*) AS qtd_investimentos,
    SUM(inv.valor_investido) AS total_valor
FROM Investimentos inv
JOIN Tipos_Investimento ti ON inv.id_tipo_investimento = ti.id_tipo_investimento
GROUP BY ti.risco;

---10. ✅ Volume movimentado por instituição financeira

SELECT 
    inst.nome AS instituicao,
    COUNT(*) AS qtd_investimentos,
    SUM(inv.valor_investido) AS total_movimentado
FROM Investimentos inv
JOIN Instituicoes inst ON inv.cnpj_instituicao = inst.cnpj
GROUP BY inst.nome;

--11. ✅ Evolução mensal dos aportes
SELECT 
    STRFTIME('%Y-%m', data_transacao) AS mes,
    SUM(valor) AS total_aportado
FROM Transacoes
WHERE tipo_transacao = 'Depósito'
GROUP BY mes
ORDER BY mes;

--12. ✅ Carteiras com mais de 1 tipo de investimento

SELECT 
    c.nome_carteira,
    i.nome AS investidor,
    COUNT(DISTINCT inv.id_tipo_investimento) AS tipos_distintos
FROM Investimentos inv
JOIN Carteiras c ON inv.id_carteira = c.id_carteira
JOIN Investidores i ON c.cpf_investidor = i.cpf
GROUP BY c.id_carteira
HAVING tipos_distintos > 1;


--13. ✅ Investidores que receberam mais rendimento
SELECT 
    i.nome AS investidor,
    SUM(t.valor) AS total_rendimento
FROM Transacoes t
JOIN Carteiras c ON t.id_carteira = c.id_carteira
JOIN Investidores i ON c.cpf_investidor = i.cpf
WHERE t.tipo_transacao = 'Rendimento'
GROUP BY i.cpf
ORDER BY total_rendimento DESC;

--14. ✅ Carteiras com maior volume de transações

SELECT 
    c.nome_carteira,
    i.nome AS investidor,
    COUNT(t.id_transacao) AS qtd_transacoes
FROM Carteiras c
JOIN Investidores i ON c.cpf_investidor = i.cpf
LEFT JOIN Transacoes t ON t.id_carteira = c.id_carteira
GROUP BY c.id_carteira
ORDER BY qtd_transacoes DESC;


--15. ✅ Ranking de investidores por número de investimentos ativos
SELECT 
    i.nome AS investidor,
    COUNT(inv.id_investimento) AS qtd_investimentos
FROM Investimentos inv
JOIN Carteiras c ON inv.id_carteira = c.id_carteira
JOIN Investidores i ON c.cpf_investidor = i.cpf
GROUP BY i.cpf
ORDER BY qtd_investimentos DESC;
