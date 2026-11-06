# Chinook Music Store — SQL Business Analysis

**Stack:** Google BigQuery (GoogleSQL) · SQL JOINs · Aggregations · Customer and Sales Analytics

## Project overview

An educational SQL project using the Chinook sample music-store database. The goal was to answer business questions about artists, countries, sales, and customer preferences through relational queries and interpretable metrics.

This repository showcases **four self-directed analyses** from the Gold level of the Chinook coursework, in addition to earlier SQL exercises completed during training. Each featured query uses `JOIN` and aggregation.

## Business questions and SQL queries

| Question | SQL file | Method |
|---|---|---|
| Which artists have the most diverse catalogs? | [01_artist_genre_diversity.sql](sql/01_artist_genre_diversity.sql) | Multiple joins; distinct genres and tracks |
| Where is the average customer basket highest? | [02_average_basket_by_country.sql](sql/02_average_basket_by_country.sql) | Average invoice value by country; minimum sample filter |
| How does revenue change by month? | [03_monthly_revenue_trends.sql](sql/03_monthly_revenue_trends.sql) | Monthly aggregation of invoice-line revenue |
| Which customers explore the widest range of genres? | [04_customer_genre_diversity.sql](sql/04_customer_genre_diversity.sql) | Distinct purchased genres and tracks; customer spending |

## Selected findings

These values are reproduced from the original coursework write-up; they have **not been independently rerun** for this repository.

- **Catalog diversity:** Iron Maiden led the selected artist ranking with **4 distinct genres** and **213 tracks**. Other artists in the reported top five had 3 genres each.
- **Average basket:** Among countries with at least five invoices, **Chile** had the highest reported average invoice total (**6.66**); **Ireland** and **Hungary** followed at **6.52**. The United States had more invoices (91) but a lower average (**5.75**).
- **Monthly revenue:** The original analysis reported a peak of **52.62 in January 2010**, compared with a low of **35.64 in January 2009**.
- **Genre exploration:** **Luis Rojas** purchased music across **12 distinct genres**, with **38 unique tracks** and **46.62** in spending. Diversity of purchased genres does not necessarily correlate with the highest spending.

See [INSIGHTS.md](INSIGHTS.md) for the question-by-question interpretation and limitations.

## Running the SQL

1. Use a copy of the **Chinook** sample dataset in Google BigQuery.
2. Open a file in [`sql/`](sql/).
3. Replace `YOUR_PROJECT.YOUR_DATASET` in the fully qualified table names with your own project and dataset identifiers.
4. Execute in BigQuery using **GoogleSQL (Standard SQL)**.

The repository deliberately **does not contain credentials, private data, or course-specific BigQuery project identifiers**. It also does not include the underlying sample database; the queries are provided for review and reproduction using your own Chinook data.

## Notes and limitations

- This is an **educational case study**, not analysis of a live retail business.
- Customer names and transactions in Chinook are example data.
- Rankings depend on the particular Chinook dataset version and the filters stated in each query.
- The country average-basket ranking excludes countries with fewer than five invoices; this helps avoid extremely small samples but does not eliminate sampling uncertainty.
- The revenue query groups by invoice date; each invoice is counted once despite the one-to-many join to invoice lines.
- Charts from the original assignment can be added separately after verifying their labels and source data.

## Portfolio focus

This project demonstrates the ability to translate business questions into SQL, navigate related tables, aggregate sales measures, and communicate results in plain language.
