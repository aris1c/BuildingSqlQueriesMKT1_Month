SELECT P.OUTLET_PBI, P.NAME, P.ABBR, P.ADDRESS, P.CITY_ID, P.REGION_ID, P.PHONE, P.FAX
FROM OUTLET O
JOIN OUTLET_PBI P ON O.OUTLET_ID = P.OUTLET_PBI
JOIN OUTLET_PBI_DET D ON O.OUTLET_ID = D.OUTLET_ID;