# Chinook — analytical findings

This file summarizes **four independent Gold-level questions** from the original coursework submission. Values below are those **reported in that submission**, not new calculations.

## 1. Artist catalog diversity

**Business question:** Which artists have music in the most distinct genres?

**Metric:** `COUNT(DISTINCT GenreId)` per artist; `COUNT(DISTINCT TrackId)` is a tie-breaker.

**Reported finding:** Iron Maiden had 4 distinct genres and 213 tracks. The other reported top-five artists had 3 genres and between 32 and 57 tracks.

**Interpretation:** A more diverse catalog may be relevant for assortment analysis, but catalog size and number of genre labels are not measures of audience demand.

## 2. Average invoice value by country

**Business question:** Where are average invoice totals highest?

**Metric:** Mean `Invoice.Total` per country, restricted to countries with at least 5 invoices.

**Reported finding:** Chile 6.66, Ireland 6.52, Hungary 6.52; US 5.75 despite 91 invoices.

**Interpretation:** High purchase volume and large average baskets are different dimensions of sales performance. Rankings from countries with a small number of orders should be interpreted cautiously.

## 3. Monthly store revenue

**Business question:** How did revenue change month by month?

**Metric:** Monthly `SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity)` and the number of unique invoices.

**Reported finding:** Peak revenue 52.62 in January 2010; also elevated in April 2011 (51.62) and June 2011 (50.62). Lowest reported month: January 2009 (35.64). The original write-up described most months as relatively stable.

**Interpretation:** Isolated high months deserve investigation. The time series alone does not identify causes.

## 4. Customer genre diversity

**Business question:** Which customers purchased the widest range of music genres?

**Metric:** Number of distinct purchased genres per customer; distinct tracks and spending as supporting metrics.

**Reported finding:** Luis Rojas: 12 genres, 38 tracks, 46.62 spending. Ladislav Kovács: 11 genres and 45.62 spending. Helena Holý spent 49.62 but purchased across 9 genres.

**Interpretation:** Variety in customer purchases is not equivalent to spending. These measures could support different audience segmentation strategies in a real business context.

## Scope

The source was a completed educational assignment and its recorded conclusions. The SQL is kept in separate files for repeatability; query results and diagrams should be rerun/recreated against a confirmed version of the Chinook sample before being represented as newly validated findings.
