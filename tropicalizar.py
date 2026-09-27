import pandas as pd
import numpy as np

# 1. Cargar el dataset original crudo
df = pd.read_csv('data/raw/BankChurners.csv')

# Limpieza: sacamos columnas basura de Kaggle y el ID del cliente
df = df.iloc[:, :-2]
if 'CLIENTNUM' in df.columns:
    df = df.drop('CLIENTNUM', axis=1)

# 2. Tropicalización (Dólares a Pesos ARS) - Simulamos TC $1000
tc = 1000
columnas_monetarias = ['Credit_Limit', 'Total_Revolving_Bal', 'Avg_Open_To_Buy', 'Total_Trans_Amt']
for col in columnas_monetarias:
    df[col] = df[col] * tc

# 3. Adaptación a Naranja X
map_tarjetas = {
    'Blue': 'NX Clásica', 
    'Silver': 'NX Oro', 
    'Gold': 'NX Platinum', 
    'Platinum': 'NX Signature'
}
df['Card_Category'] = df['Card_Category'].map(map_tarjetas)

# 4. Inyectar variable de adopción de cuenta remunerada (Insights de negocio)
np.random.seed(42)
df['Usa_Cuenta_Remunerada'] = np.where(
    df['Customer_Age'] < 40,
    np.random.choice([1, 0], size=len(df), p=[0.75, 0.25]),
    np.random.choice([1, 0], size=len(df), p=[0.35, 0.65])
)

# 5. Target: 1 = Churn (Se fue), 0 = Activo (Se quedó)
df['Churn'] = df['Attrition_Flag'].apply(lambda x: 1 if x == 'Attrited Customer' else 0)

# 6. Guardar en la carpeta de procesados
df.to_csv('data/processed/naranjax_churn_dataset.csv', index=False)
print("¡Dataset tropicalizado guardado con éxito!")