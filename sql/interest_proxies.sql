--helper logic to map state names to msa's
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

--reformatting (unmpivoting) combined_trends_x csv's for analysis
CREATE TABLE league_interest_long AS
SELECT
    Week,
    market_key,
    interest_league
FROM combined_trends_wnba
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
        washington
    )
);
CREATE TABLE team_interest_long AS
SELECT
    Week,
    market_key,
    interest_team
FROM combined_trends_team
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
CREATE TABLE player_interest_long AS
SELECT
    Week,
    market_key,
    interest_player
FROM combined_trends_player
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

-- building the actual interst_proxies csv
CREATE TABLE interest_proxies AS
SELECT
    l.Week,
    m.market_msa,
    l.interest_league,
    t.interest_team,
    p.interest_player,
    d.pop_total,
    d.median_income
FROM league_interest_long l
LEFT JOIN team_interest_long t
    ON l.Week = t.Week AND l.market_key = t.market_key
LEFT JOIN player_interest_long p
    ON l.Week = p.Week AND l.market_key = p.market_key
LEFT JOIN market_lookup m
    ON l.market_key = m.market_key
LEFT JOIN read_csv_auto('market_demographics.csv') d
    ON m.market_msa = d.msa;