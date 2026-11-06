-- Question: Which countries have the highest average invoice total?
-- Dialect: GoogleSQL (BigQuery)
-- Limit comparison to countries with at least five invoices.
-- Replace YOUR_PROJECT.YOUR_DATASET with your own BigQuery project and dataset.

SELECT
    c.Country,
    ROUND(AVG(i.Total), 2) AS Avg_Basket_Value,
    COUNT(DISTINCT i.InvoiceId) AS Number_of_Purchases
FROM `YOUR_PROJECT.YOUR_DATASET.customer` AS c
JOIN `YOUR_PROJECT.YOUR_DATASET.invoice` AS i
    ON c.CustomerId = i.CustomerId
GROUP BY c.Country
HAVING COUNT(DISTINCT i.InvoiceId) >= 5
ORDER BY Avg_Basket_Value DESC
LIMIT 10;
