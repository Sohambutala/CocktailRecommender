CREATE IF NOT EXISTS DATABASE CocktailDatabase;
USE CocktailDatabase;

-- TRUNCATE TABLE CocktailVectors;
-- DROP TABLE CocktailVectors;

CREATE TABLE IF NOT EXISTS CocktailVectors(
name varchar(255),
text TEXT,
vector blob
);

-- DROP PIPELINE vectorpipeline;

CREATE PIPELINE vectorpipeline AS LOAD DATA AZURE 'CONTAINER_NAME'  
CREDENTIALS '{"account_name": "ACCOUNT_NAME", "account_key":  "ACCOUNT_KEY"}'  
INTO TABLE `CocktailVectors` 
FORMAT JSON
(@vector_var <- vector, name <- name, text <- text)
SET vector = JSON_ARRAY_PACK(@vector_var);

START PIPELINE vectorpipeline FOREGROUND;

SELECT * FROM CocktailVectors;
