   SELECT TO_CHAR(TGL,'YYYY'), TO_CHAR(TGL,'MM'), OUTLET_PBI, 
    SUM(PATIENT),
    SUM(TEST),
    SUM(BRUTO),
    SUM(DISKON),
    SUM(NETTO),
    SUM(RETUR),
    SUM(TOTAL)
FROM SALES0_ARIS 
WHERE TGL >=TO_DATE(TO_CHAR(SYSDATE-60,'YY-MM')||'-01','yy/MM/DD')--TO_DATE('1-'||TO_CHAR(SYSDATE-60,'MM-YYYY'))
GROUP BY TO_CHAR(TGL,'YYYY'), TO_CHAR(TGL,'MM'), OUTLET_PBI

----
Perbaikan query

CREATE OR REPLACE VIEW SALES1MONTH_ARIS AS
SELECT
    TO_CHAR(TGL, 'YYYY') AS YEAR,
    TO_CHAR(TGL, 'MM') AS MONTH,
    OUTLET_PBI,
    SUM(PATIENT) AS SUM_PATIENT,
    SUM(TEST) AS SUM_TEST,
    SUM(BRUTO) AS SUM_BRUTO,
    SUM(DISKON) AS SUM_DISKON,
    SUM(NETTO) AS SUM_NETTO,
    SUM(RETUR) AS SUM_RETUR,
    SUM(TOTAL) AS SUM_TOTAL
FROM
    SALES0_ARIS
WHERE
    TGL >= TO_DATE(TO_CHAR(SYSDATE-60, 'YY-MM') || '-01', 'yy/MM/DD')
GROUP BY
    TO_CHAR(TGL, 'YYYY'),
    TO_CHAR(TGL, 'MM'),
    OUTLET_PBI;