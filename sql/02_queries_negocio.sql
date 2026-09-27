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