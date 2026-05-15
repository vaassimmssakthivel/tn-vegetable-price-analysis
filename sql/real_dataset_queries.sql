--FIRST REAL QUERY
--VERIFY TABLE CONTENT
SELECT *
FROM vegetable_prices
LIMIT 10;



--BUSINESS QUESTION
--Which districts have highest average vegetable prices?
--District-wise average prices
SELECT district ,avg(retail_price_inr_per_kg) as avg_retail_price
FROM vegetable_prices
GROUP BY district
ORDER BY avg(retail_price_inr_per_kg) DESC;


--Seasonal analysis
--Which season produces highest retail prices?
SELECT  season ,avg(retail_price_inr_per_kg) as avg_retail_price
FROM vegetable_prices
GROUP BY season
ORDER BY avg(retail_price_inr_per_kg) DESC
LIMIT 1;

--Transport cost analysis
SELECT transport_mode,
AVG(transport_cost_inr) AS avg_transport_cost
FROM vegetable_prices
GROUP BY transport_mode
ORDER BY avg_transport_cost DESC;

--Profit margin analysis
SELECT vegetable_name,
AVG(
    retail_price_inr_per_kg
    - farm_price_inr_per_kg
) AS avg_margin
FROM vegetable_prices
GROUP BY vegetable_name
ORDER BY avg_margin DESC;

--FIND TOP 5 MOST EXPENSIVE VEGETABLES
SELECT vegetable_name,
AVG(retail_price_inr_per_kg) AS avg_price
FROM vegetable_prices
GROUP BY vegetable_name
ORDER BY avg_price DESC
LIMIT 5;

--FIND LOWEST PRICE DISTRICTS
SELECT district,
AVG(retail_price_inr_per_kg) AS avg_price
FROM vegetable_prices
GROUP BY district
ORDER BY avg_price ASC
LIMIT 10;

--COUNT RECORDS BY SEASON
SELECT season,
COUNT(*) AS total_records
FROM vegetable_prices
GROUP BY season;

--HIGH MARGIN VEGETABLES
SELECT vegetable_name,
AVG(
    retail_price_inr_per_kg
    - farm_price_inr_per_kg
) AS avg_margin
FROM vegetable_prices
GROUP BY vegetable_name
ORDER BY avg_margin DESC
LIMIT 10;

--FIND DISTRICTS WITH HIGH WASTAGE
SELECT district,
AVG(post_harvest_loss_pct) AS avg_loss
FROM vegetable_prices
GROUP BY district
ORDER BY avg_loss DESC;

--FIND MOST USED TRANSPORT MODE
SELECT transport_mode,
COUNT(*) AS usage_count
FROM vegetable_prices
GROUP BY transport_mode
ORDER BY usage_count DESC;

--DATE-BASED ANALYSIS
SELECT SUBSTR(date,1,4) AS year,
AVG(retail_price_inr_per_kg) AS avg_price
FROM vegetable_prices
GROUP BY year
ORDER BY year;

--FIND PRICE VOLATILITY
--Which vegetables fluctuate most?
SELECT vegetable_name,
MAX(retail_price_inr_per_kg)
-
MIN(retail_price_inr_per_kg)
AS price_range
FROM vegetable_prices
GROUP BY vegetable_name
ORDER BY price_range DESC;

--FILTER HIGH PRICES
SELECT vegetable_name,
district,
retail_price_inr_per_kg
FROM vegetable_prices
WHERE retail_price_inr_per_kg > 100
ORDER BY retail_price_inr_per_kg DESC;

--COMBINED CONDITIONS
SELECT *
FROM vegetable_prices
WHERE season = 'Summer'
AND retail_price_inr_per_kg > 80;

--LIKE OPERATOR
--Finds vegetables starting with:
SELECT vegetable_name
FROM vegetable_prices
WHERE vegetable_name LIKE 'T%';