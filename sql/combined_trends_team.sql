CREATE TABLE combined_trends_team AS
SELECT
    i.Week,

    CAST(i."indiana fever: (Indiana)" AS INTEGER)                     AS indiana,
    CAST(az."phoenix mercury: (Arizona)" AS INTEGER)                  AS arizona,
    CAST(dc."washington mystics: (District of Columbia)" AS INTEGER)  AS district_of_columbia,
    CAST(ga."atlanta dream: (Georgia)" AS INTEGER)                    AS georgia,
    CAST(il."chicago sky: (Illinois)" AS INTEGER)                     AS illinois,
    CAST(mn."minnesota lynx: (Minnesota)" AS INTEGER)                 AS minnesota,
    CAST(nv."las vegas aces: (Nevada)" AS INTEGER)                    AS nevada,
    CAST(ny."new york liberty: (New York)" AS INTEGER)                AS new_york,
    CAST(tx."dallas wings: (Texas)" AS INTEGER)                       AS texas,
    CAST(wa."seattle storm: (Washington)" AS INTEGER)                 AS washington,
    CAST(sp."los angeles sparks: (California)" AS INTEGER)            AS sparks,
    CAST(val."golden state valkyries: (California)" AS INTEGER)       AS valkyries

FROM read_csv_auto('trends_team_indiana.csv', skip=2, all_varchar=true) i

LEFT JOIN read_csv_auto('trends_team_arizona.csv', skip=2, all_varchar=true) az
    ON i.Week = az.Week
LEFT JOIN read_csv_auto('trends_team_districtofcolumbia.csv', skip=2, all_varchar=true) dc
    ON i.Week = dc.Week
LEFT JOIN read_csv_auto('trends_team_georgia.csv', skip=2, all_varchar=true) ga
    ON i.Week = ga.Week
LEFT JOIN read_csv_auto('trends_team_illinois.csv', skip=2, all_varchar=true) il
    ON i.Week = il.Week
LEFT JOIN read_csv_auto('trends_team_minnesota.csv', skip=2, all_varchar=true) mn
    ON i.Week = mn.Week
LEFT JOIN read_csv_auto('trends_team_nevada.csv', skip=2, all_varchar=true) nv
    ON i.Week = nv.Week
LEFT JOIN read_csv_auto('trends_team_newyork.csv', skip=2, all_varchar=true) ny
    ON i.Week = ny.Week
LEFT JOIN read_csv_auto('trends_team_texas.csv', skip=2, all_varchar=true) tx
    ON i.Week = tx.Week
LEFT JOIN read_csv_auto('trends_team_washington.csv', skip=2, all_varchar=true) wa
    ON i.Week = wa.Week
LEFT JOIN read_csv_auto('trends_team_sparks.csv', skip=2, all_varchar=true) sp
    ON i.Week = sp.Week
LEFT JOIN read_csv_auto('trends_team_valkyries.csv', skip=2, all_varchar=true) val
    ON i.Week = val.Week;