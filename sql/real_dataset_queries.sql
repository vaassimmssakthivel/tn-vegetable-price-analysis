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