-- Creación de la tabla principal de clientes para el análisis de Churn
CREATE TABLE clientes_naranjax (
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    Income_Category VARCHAR(50),
    Card_Category VARCHAR(30),       -- Ej: NX Clásica, NX Oro, etc.
    Months_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive_12_mon INT,
    Contacts_Count_12_mon INT,
    Credit_Limit DECIMAL(15,2),      -- Límite en Pesos ARS
    Total_Revolving_Bal DECIMAL(15,2),
    Avg_Open_To_Buy DECIMAL(15,2),
    Total_Trans_Amt DECIMAL(15,2),
    Total_Trans_Ct INT,
    Usa_Cuenta_Remunerada INT,       -- 1 (Usa) o 0 (No usa)
    Churn INT                        -- 1 (Se fue) o 0 (Activo)
);