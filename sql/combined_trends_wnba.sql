CREATE TABLE combined_trends_wnba AS
SELECT
    i.Week,
    CAST(i."wnba: (Indiana)" AS INTEGER)               AS indiana,
    CAST(ca."wnba: (California)" AS INTEGER)           AS california,
    CAST(ny."wnba: (New York)" AS INTEGER)             AS new_york,
    CAST(tx."wnba: (Texas)" AS INTEGER)                AS texas,
    CAST(az."wnba: (Arizona)" AS INTEGER)              AS arizona,
    CAST(ct."wnba: (Connecticut)" AS INTEGER)          AS connecticut,
    CAST(ga."wnba: (Georgia)" AS INTEGER)              AS georgia,
    CAST(il."wnba: (Illinois)" AS INTEGER)             AS illinois,
    CAST(mn."wnba: (Minnesota)" AS INTEGER)            AS minnesota,
    CAST(nv."wnba: (Nevada)" AS INTEGER)               AS nevada,
    CAST(wa."wnba: (Washington)" AS INTEGER)           AS washington,
    CAST(dc."wnba: (District of Columbia)" AS INTEGER) AS district_of_columbia
FROM read_csv_auto('trends_wnba_indiana.csv', skip=2, all_varchar=true) i
LEFT JOIN read_csv_auto('trends_wnba_california.csv', skip=2, all_varchar=true) ca ON i.Week = ca.Week
LEFT JOIN read_csv_auto('trends_wnba_newyork.csv',    skip=2, all_varchar=true) ny ON i.Week = ny.Week
LEFT JOIN read_csv_auto('trends_wnba_texas.csv',      skip=2, all_varchar=true) tx ON i.Week = tx.Week
LEFT JOIN read_csv_auto('trends_wnba_arizona.csv',    skip=2, all_varchar=true) az ON i.Week = az.Week
LEFT JOIN read_csv_auto('trends_wnba_connecticut.csv',skip=2, all_varchar=true) ct ON i.Week = ct.Week
LEFT JOIN read_csv_auto('trends_wnba_georgia.csv',    skip=2, all_varchar=true) ga ON i.Week = ga.Week
LEFT JOIN read_csv_auto('trends_wnba_illinois.csv',   skip=2, all_varchar=true) il ON i.Week = il.Week
LEFT JOIN read_csv_auto('trends_wnba_minnesota.csv',  skip=2, all_varchar=true) mn ON i.Week = mn.Week
LEFT JOIN read_csv_auto('trends_wnba_nevada.csv',     skip=2, all_varchar=true) nv ON i.Week = nv.Week
LEFT JOIN read_csv_auto('trends_wnba_washington.csv', skip=2, all_varchar=true) wa ON i.Week = wa.Week
LEFT JOIN read_csv_auto('trends_wnba_districtofcolumbia.csv', skip=2, all_varchar=true) dc ON i.Week = dc.Week;