CREATE TABLE combined_trends_player AS
SELECT
    i.Week,

    CAST(i."caitlin clark: (Indiana)" AS INTEGER)              AS indiana,
    CAST(mn."napheesa collier: (Minnesota)" AS INTEGER)        AS minnesota,
    CAST(ny."breanna stewart: (New York)" AS INTEGER)          AS new_york,
    CAST(nv."a'ja wilson: (Nevada)" AS INTEGER)                AS nevada,
    CAST(az."kahleah copper: (Arizona)" AS INTEGER)            AS arizona,
    CAST(il."angel reese: (Illinois)" AS INTEGER)              AS illinois,
    CAST(ga."rhyne howard: (Georgia)" AS INTEGER)              AS georgia,
    CAST(tx."paige bueckers: (Texas)" AS INTEGER)              AS texas,
    CAST(dc."kiki iriafen: (District of Columbia)" AS INTEGER) AS district_of_columbia,
    CAST(wa."skylar diggins: (Washington)" AS INTEGER)         AS washington,
    CAST(sp."cameron brink: (California)" AS INTEGER)          AS sparks,
    CAST(val."veronica burton: (California)" AS INTEGER)      AS valkyries

FROM read_csv_auto('trends_player_indiana.csv', skip=2, all_varchar=true) i

LEFT JOIN read_csv_auto('trends_player_minnesota.csv', skip=2, all_varchar=true) mn
    ON i.Week = mn.Week
LEFT JOIN read_csv_auto('trends_player_newyork.csv', skip=2, all_varchar=true) ny
    ON i.Week = ny.Week
LEFT JOIN read_csv_auto('trends_player_nevada.csv', skip=2, all_varchar=true) nv
    ON i.Week = nv.Week
LEFT JOIN read_csv_auto('trends_player_arizona.csv', skip=2, all_varchar=true) az
    ON i.Week = az.Week
LEFT JOIN read_csv_auto('trends_player_illinois.csv', skip=2, all_varchar=true) il
    ON i.Week = il.Week
LEFT JOIN read_csv_auto('trends_player_georgia.csv', skip=2, all_varchar=true) ga
    ON i.Week = ga.Week
LEFT JOIN read_csv_auto('trends_player_texas.csv', skip=2, all_varchar=true) tx
    ON i.Week = tx.Week
LEFT JOIN read_csv_auto('trends_player_districtofcolumbia.csv', skip=2, all_varchar=true) dc
    ON i.Week = dc.Week
LEFT JOIN read_csv_auto('trends_player_washington.csv', skip=2, all_varchar=true) wa
    ON i.Week = wa.Week
LEFT JOIN read_csv_auto('trends_player_sparks.csv', skip=2, all_varchar=true) sp
    ON i.Week = sp.Week
LEFT JOIN read_csv_auto('trends_player_valkyries.csv', skip=2, all_varchar=true) val
    ON i.Week = val.Week;
