# 🍊 Naranja X — Predicción de Churn & Estrategia de Retención de Clientes

![Stack](https://img.shields.io/badge/Stack-SQL%20%7C%20Python%20%7C%20Power%20BI-orange)
![ML Model](https://img.shields.io/badge/Machine%20Learning-Random%20Forest-blue)
![Recall Metric](https://img.shields.io/badge/Recall-85%25-success)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📌 Contexto & Problema de Negocio
En la industria **Fintech de Argentina**, el costo de adquisición de clientes (CAC) es significativamente más alto que el costo de retención. **Naranja X** busca identificar de forma proactiva a aquellos usuarios con alta probabilidad de abandono (*Churn*) de sus servicios financieros antes de que cancelen definitivamente su cuenta.

**Objetivo del proyecto:**  
Desarrollar un flujo analítico integral end-to-end (**PostgreSQL $\rightarrow$ Python ML $\rightarrow$ Power BI**) que permita predecir el riesgo de fuga con un enfoque financiero, diagnosticar sus causas raíz y cuantificar el valor económico rescatable mediante simulaciones interactivas.

---

## 📊 Resumen Ejecutivo & Impacto Financiero
* **Total de Clientes Evaluados:** 2.026 usuarios.
* **Clientes Identificados en Riesgo (Churn Predicho):** 319 usuarios (**15,75%** de la cartera).
* **Monto Total Expuesto al Riesgo:** **$941,95 millones ARS**.
* **Simulación de Retención (Escenario Base 10%):** Recuperación proyectada de **$94,19 millones ARS**.

---

## 🛠️ Arquitectura de la Solución (Flujo End-to-End)

```
[Datos Brutos] ──> [PostgreSQL] ──> [Python (EDA + ML)] ──> [Power BI Dashboard]
  CSV Data          Queries & Cohortes   Scikit-Learn Random Forest    Visualización & What-If
```

### 1. Extracción y Modelado de Datos (PostgreSQL)
* Estructuración del esquema de base de datos relacional.
* Consultas SQL para análisis de cohorte por antigüedad (`Months_on_book`), inactividad (`Months_Inactive_12_mon`) y cálculo de ticket promedio por segmento de ingreso.

### 2. Análisis Exploratorio y Machine Learning (Python)
* **Tratamiento del Desbalance de Clase:** El target presentaba un desbalance crítico (~16% de Churn real).
* **Selección de Modelo:** Se optó por **Random Forest Classifier** ajustado sintónicamente para maximizar la métrica **Recall (~85%)**.  
  > *Justificación de Negocio:* En retención fintech, un Falso Negativo (no detectar a un cliente que se va) es astronómicamente más costoso que un Falso Positivo (ofrecer una promoción a un cliente que se iba a quedar).
* **Variables Críticas (Feature Importance):**
  1. `Total_Trans_Ct` (Frecuencia de transacciones).
  2. `Total_Trans_Amt` (Monto total operado).
  3. `Months_Inactive_12_mon` (Meses sin actividad).

### 3. Dashboard Ejecutivo e Interactivo (Power BI)
El tablero se diseñó bajo la identidad corporativa de Naranja X (`#FF6B00`), dividido en 3 páginas especializadas:
1. **Panorama General:** KPIs de alto nivel, tasa de churn predicha y volumen de dinero en riesgo.
2. **Diagnóstico & Drivers:** Análisis de causales de abandono (comportamiento transaccional y uso de líneas de crédito).
3. **Plan de Acción & Simulación:** Listado individualizado de clientes prioritarios y un **Simulador What-If** mediante parámetros DAX dinámicos.

---

## 📈 Tablero Interactivo (Power BI)

### Página 1: Panorama General
* Visualización global del volumen de clientes en peligro y distribución por niveles de producto contratados (`Total_Relationship_Count`).

### Página 2: Diagnóstico de Fuga
* **Hallazgo:** La probabilidad de churn explota dramáticamente cuando el cliente realiza **menos de 40 transacciones al año**.
* **Consumo Promedio:** El ticket promedio de consumo cae de **$4,8M ARS** (clientes activos) a **$3,0M ARS** (clientes en riesgo).

### Página 3: Plan de Acción & Simulación "What-If"
* **Fórmula DAX del Simulador:**
  $$\text{Dinero Rescatado ARS} = [\text{Monto en Riesgo ARS}] \times \text{'Porcentaje Retención'}[\text{Valor}]$$
* Permite a los gerentes comerciales simular escenarios de retención del 5% al 50% en tiempo real.

---

## 🎯 Recomendaciones de Negocio

1. **Alertas Tempranas por Caída de Actividad:** Activar campanas de re-engagement automáticas (notificaciones push / beneficios) en cuanto un usuario acumule 2 meses consecutivos de inactividad o reduzca su volumen de transacciones a menos de 4 operaciones mensuales.
2. **Estrategia Cross-Selling:** Los clientes con 1 o 2 productos contratados presentan la mayor tasa de churn. Incrementar la penetración de productos (ej. rendimientos de saldo o créditos) para aumentar el costo de cambio (*switching cost*).
3. **Acciones Comercial Directa:** Priorizar a los clientes de la Página 3 ordenados por `Total_Trans_Amt` descendente para asignar ofertas de retención personalizadas a la cartera de mayor valor.

---

## 📂 Estructura del Repositorio

```text
├── data/
│   ├── raw/BankChurners.csv
│   └── processed/datos_dashboard.csv
├── sql/
│   ├── 01_schema.sql
│   └── 02_queries_negocio.sql
├── notebooks/
│   ├── 01_eda_and_feature_engineering.ipynb
│   └── 02_churn_prediction_model.ipynb
├── dashboard/
│   └── NaranjaX_Analisis_Churn_y_Retencion.pbix
└── README.md
```

---

## ✒️ Autor
* **Perfil:** Data Analyst | Business Intelligence
* **LinkedIn:** [Tu Link de LinkedIn]
* **Portfolio GitHub:** [Tu Link de GitHub]
