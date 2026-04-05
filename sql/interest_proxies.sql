--market lookup
CREATE TABLE market_lookup AS
SELECT * FROM (
    VALUES
        ('indiana', 'Indianapolis-Carmel-Greenwood, IN'),
        ('minnesota', 'Minneapolis-St. Paul-Bloomington, MN-WI'),
        ('new_york', 'New York-Newark-Jersey City, NY-NJ'),
        ('nevada', 'Las Vegas-Henderson-North Las Vegas, NV'),
        ('arizona', 'Phoenix-Mesa-Chandler, AZ'),
        ('illinois', 'Chicago-Naperville-Elgin, IL-IN'),
        ('georgia', 'Atlanta-Sandy Springs-Roswell, GA'),
        ('texas', 'Dallas-Fort Worth-Arlington, TX'),
        ('washington', 'Washington-Arlington-Alexandria, DC-VA-MD-WV'),
        ('sparks', 'Los Angeles-Long Beach-Anaheim, CA'),
        ('valkyries', 'San Francisco-Oakland-Fremont, CA')
) AS t(market_key, market_msa);

-- unpivot league level interest
CREATE TABLE league_interest_long AS
SELECT
    Week,
    market_key,
    interest_league
FROM read_csv_auto('built/combined_trends_wnba.csv')
UNPIVOT (
    interest_league FOR market_key IN (
        indiana,
        minnesota,
        new_york,
        nevada,
        arizona,
        illinois,
        georgia,
        texas,
        washington,
        sparks,
        valkyries
    )
);

-- unpivot team level interest
CREATE TABLE team_interest_long AS
SELECT
    Week,
    market_key,
    interest_team
FROM read_csv_auto('built/combined_trends_team.csv')
UNPIVOT (
    interest_team FOR market_key IN (
        indiana,
        minnesota,
        new_york,
        nevada,
        arizona,
        illinois,
        georgia,
        texas,
        washington,
        sparks,
        valkyries
    )
);

-- unpivot player level interest
CREATE TABLE player_interest_long AS
SELECT
    Week,
    market_key,
    interest_player
FROM read_csv_auto('built/combined_trends_player.csv')
UNPIVOT (
    interest_player FOR market_key IN (
        indiana,
        minnesota,
        new_york,
        nevada,
        arizona,
        illinois,
        georgia,
        texas,
        washington,
        sparks,
        valkyries
    )
);

-- build interest_proxies
CREATE TABLE interest_proxies AS
SELECT
    l.Week,
    m.market_msa,
    l.interest_league,
    t.interest_team,
    p.interest_player,
    CAST(d.pop_total AS DOUBLE) AS pop_total,
    CAST(
        REPLACE(REPLACE(d.median_income, '$', ''), ',', '')
        AS DOUBLE
    ) AS median_income
FROM league_interest_long l
LEFT JOIN team_interest_long t
    ON l.Week = t.Week
   AND l.market_key = t.market_key
LEFT JOIN player_interest_long p
    ON l.Week = p.Week
   AND l.market_key = p.market_key
LEFT JOIN market_lookup m
    ON l.market_key = m.market_key
LEFT JOIN read_csv_auto('built/market_demographics.csv') d
    ON m.market_msa = d.msa;