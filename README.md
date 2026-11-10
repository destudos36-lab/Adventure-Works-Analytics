# 🚴 Adventure Works (AW) - Modern Data Platform & Analytics Engineering

[![dbt](https://img.shields.io/badge/dbt-Cloud-orange?logo=dbt)](https://www.getdbt.com/)
[![Databricks](https://img.shields.io/badge/Databricks-Lakehouse-red?logo=databricks)](https://databricks.com/)
[![Power BI](https://img.shields.io/badge/Power_BI-Analytics-yellow?logo=powerbi)](https://powerbi.microsoft.com/)
[![GitHub](https://img.shields.io/badge/Git-Version_Control-blue?logo=github)](https://github.com/)

---

## 📌 1. Visão Geral do Projeto

A **Adventure Works (AW)** é uma indústria de bicicletas em expansão, com mais de 500 produtos, 20.000 clientes e 31.000 pedidos.

Este projeto implementa uma **Plataforma Moderna de Dados (Modern Data Stack)** de ponta a ponta, transformando dados brutos em informações estratégicas para apoiar a tomada de decisão baseada em dados (*Data-Driven Decision Making*).

### 🎯 Objetivos Principais

- **Centralização e Governança:** Consolidação dos dados transacionais da empresa no Data Warehouse utilizando Databricks.
- **Transformação Escalável:** Modelagem dimensional em estrela (*Star Schema*) utilizando dbt Cloud.
- **Garantia da Qualidade:** Implementação de testes de integridade referencial, validação de fontes e auditoria contábil.
- **Tomada de Decisão:** Desenvolvimento de dashboards interativos no Power BI, com foco em storytelling executivo e análise tática.

---

## 🏗️ 2. Arquitetura da Solução

A arquitetura foi desenvolvida seguindo os princípios de uma Modern Data Platform, contemplando ingestão, armazenamento, transformação, governança e visualização.

### 🔄 Fluxo de Dados

```mermaid
flowchart TD
    A[PostgreSQL<br/>Dados de Origem] 
    --> B[Python<br/>Ingestão de Dados - EL]

    B --> C[Databricks RAW<br/>Schema: adventure_works]

    C --> D[dbt Cloud<br/>Ambientes DEV / PROD]

    D --> E[Staging<br/>stg_]

    E --> F[Intermediate<br/>int_]

    F --> G[Marts<br/>dim_ / fact_]

    G --> H[Governança e CI/CD<br/>dbt Test / Docs / Lineage]

    H --> I[Power BI<br/>DirectQuery / Import]

    I --> J[Dashboards Analíticos<br/>Executive Summary / Deep Dive]

    style A fill:#336791,color:#fff
    style C fill:#E53935,color:#fff
    style D fill:#FF7043,color:#fff
    style G fill:#2E7D32,color:#fff
    style I fill:#EAB308,color:#000
