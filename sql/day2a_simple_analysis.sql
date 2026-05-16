--TOP PROFIT DISTRICTS
SELECT district,
AVG(
    retail_price_inr_per_kg
    - farm_price_inr_per_kg
) AS avg_margin
FROM TN_Vegetable_Price_Index_Enhanced
GROUP BY district
ORDER BY avg_margin DESC;

--YEARLY PRICE TREND
SELECT SUBSTR(date,1,4) AS year,
AVG(retail_price_inr_per_kg) AS avg_price
FROM TN_Vegetable_Price_Index_Enhanced
GROUP BY year
ORDER BY year;

--HIGHEST VOLATILITY
SELECT vegetable_name,
MAX(retail_price_inr_per_kg)
-
MIN(retail_price_inr_per_kg)
AS price_range
FROM TN_Vegetable_Price_Index_Enhanced
GROUP BY vegetable_name
ORDER BY price_range DESC;