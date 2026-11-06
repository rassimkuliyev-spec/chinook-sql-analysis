-- Question: How did store revenue change from month to month?
-- Dialect: GoogleSQL (BigQuery)
-- Revenue is reconstructed from invoice lines: UnitPrice * Quantity.
-- Replace YOUR_PROJECT.YOUR_DATASET with your own BigQuery project and dataset.

SELECT
    FORMAT_DATE('%Y-%m', DATE(i.InvoiceDate)) AS Month,
    ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Total_Revenue,
    COUNT(DISTINCT i.InvoiceId) AS Invoice_Count
FROM `YOUR_PROJECT.YOUR_DATASET.invoice` AS i
JOIN `YOUR_PROJECT.YOUR_DATASET.invoiceline` AS il
    ON i.InvoiceId = il.InvoiceId
GROUP BY Month
ORDER BY Month;
