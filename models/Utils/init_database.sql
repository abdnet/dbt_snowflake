
{{
    config(
        enabled=false,
        tags=['init']
    )
}}

-- Création ou remplacement de l'entrepôt de données (warehouse)
CREATE OR REPLACE WAREHOUSE WH_002
    WAREHOUSE_SIZE = 'MEDIUM'
    WAREHOUSE_TYPE = 'STANDARD'
    AUTO_SUSPEND = 600
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

-- Changement vers l'entrepôt nouvellement créé
USE WAREHOUSE WH_002;

-- Création ou remplacement de la base de données RAW
CREATE OR REPLACE DATABASE RAW2;
-- Création ou remplacement de la base de données ANALYTICS
CREATE OR REPLACE DATABASE ANALYTICS;

-- Changement vers la base de données RAW
