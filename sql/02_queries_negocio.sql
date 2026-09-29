-- 1. ¿Cuál es la Tasa de Fuga (Churn Rate) global de la fintech?
SELECT 
    COUNT(*) AS total_clientes,
    SUM(Churn) AS clientes_fugados,
    ROUND((SUM(Churn) * 100.0 / COUNT(*)), 2) AS tasa_churn_porcentaje
FROM clientes_naranjax;

-- 2. ¿Qué producto tiene mayor problema de retención? (Churn por Tarjeta)
SELECT 
    Card_Category,
    COUNT(*) AS total_clientes,
    SUM(Churn) AS clientes_fugados,
    ROUND((SUM(Churn) * 100.0 / COUNT(*)), 2) AS tasa_churn_porcentaje
FROM clientes_naranjax
GROUP BY Card_Category
ORDER BY tasa_churn_porcentaje DESC;

-- 3. ¿Tener saldo en la Cuenta Remunerada ayuda a fidelizar al cliente?
SELECT 
    Usa_Cuenta_Remunerada,
    COUNT(*) AS total_clientes,
    ROUND((SUM(Churn) * 100.0 / COUNT(*)), 2) AS tasa_churn_porcentaje
FROM clientes_naranjax
GROUP BY Usa_Cuenta_Remunerada;

-- 4. ¿Existe una caída clara en el Ticket Promedio de los clientes que se fugan?
SELECT 
    Churn,
    COUNT(*) AS total_clientes,
    ROUND(AVG(Total_Trans_Amt), 2) AS consumo_promedio_ars,
    ROUND(AVG(Total_Trans_Ct), 2) AS transacciones_promedio,
    ROUND(AVG(Total_Trans_Amt / NULLIF(Total_Trans_Ct, 0)), 2) AS ticket_promedio_ars
FROM clientes_naranjax
GROUP BY Churn;

-- 5. "Money Maker Query": Top clientes de alto valor (alto límite/consumo) en riesgo inminente
-- Criterio: Más de 3 meses inactivos y con un consumo histórico elevado
SELECT 
    Credit_Limit,
    Total_Trans_Amt,
    Months_Inactive_12_mon,
    Total_Trans_Ct
FROM clientes_naranjax
WHERE Churn = 0 
  AND Months_Inactive_12_mon >= 3
ORDER BY Total_Trans_Amt DESC
LIMIT 20;