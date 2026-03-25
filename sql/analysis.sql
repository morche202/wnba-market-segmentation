CREATE TABLE missed_revenue_opportunity AS
WITH base AS (
    SELECT
        Week,
        market_msa,

        -- Ensure numeric population
        CAST(pop_total AS DOUBLE) AS pop_total,

        -- Clean and cast median income
        CAST(
            REPLACE(REPLACE(median_income, '$', ''), ',', '')
            AS DOUBLE
        ) AS median_income,

        -- Composite attention signal (index)
        (interest_league + interest_team + interest_player) AS total_interest,

        -- Interest per capita
        (interest_league + interest_team + interest_player)
        / CAST(pop_total AS DOUBLE) AS interest_pc
    FROM interest_proxies
),
normalized AS (
    SELECT
        *,
        -- Normalize interest intensity
        interest_pc
        / MAX(interest_pc) OVER () AS interest_pc_norm,

        -- Normalize income (now numeric)
        median_income
        / MAX(median_income) OVER () AS income_norm
    FROM base
)
SELECT
    Week,
    market_msa,
    interest_pc_norm,
    income_norm,

    -- Final missed revenue opportunity score
    interest_pc_norm * income_norm AS missed_revenue_score
FROM normalized;