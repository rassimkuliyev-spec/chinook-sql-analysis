-- Question: Which customers have the most diverse music purchases?
-- Dialect: GoogleSQL (BigQuery)
-- Diversity is measured by distinct purchased genres.
-- Replace YOUR_PROJECT.YOUR_DATASET with your own BigQuery project and dataset.

SELECT
    c.CustomerId,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    COUNT(DISTINCT g.GenreId) AS Unique_Genres,
    COUNT(DISTINCT t.TrackId) AS Unique_Tracks,
    ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS Total_Spent
FROM `YOUR_PROJECT.YOUR_DATASET.customer` AS c
JOIN `YOUR_PROJECT.YOUR_DATASET.invoice` AS i
    ON c.CustomerId = i.CustomerId
JOIN `YOUR_PROJECT.YOUR_DATASET.invoiceline` AS il
    ON i.InvoiceId = il.InvoiceId
JOIN `YOUR_PROJECT.YOUR_DATASET.track` AS t
    ON il.TrackId = t.TrackId
JOIN `YOUR_PROJECT.YOUR_DATASET.genre` AS g
    ON t.GenreId = g.GenreId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
ORDER BY
    Unique_Genres DESC,
    Total_Spent DESC
LIMIT 10;
