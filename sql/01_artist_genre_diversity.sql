-- Question: Which artists have the most diverse music catalogs?
-- Dialect: GoogleSQL (BigQuery)
-- Replace YOUR_PROJECT.YOUR_DATASET with the dataset used in your BigQuery environment.

SELECT
    ar.Name AS Artist,
    COUNT(DISTINCT g.GenreId) AS Genre_Count,
    COUNT(DISTINCT t.TrackId) AS Track_Count
FROM `YOUR_PROJECT.YOUR_DATASET.artist` AS ar
JOIN `YOUR_PROJECT.YOUR_DATASET.album` AS al
    ON ar.ArtistId = al.ArtistId
JOIN `YOUR_PROJECT.YOUR_DATASET.track` AS t
    ON al.AlbumId = t.AlbumId
JOIN `YOUR_PROJECT.YOUR_DATASET.genre` AS g
    ON t.GenreId = g.GenreId
GROUP BY
    ar.ArtistId,
    ar.Name
ORDER BY
    Genre_Count DESC,
    Track_Count DESC
LIMIT 5;
