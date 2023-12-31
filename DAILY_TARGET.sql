SELECT A.OUTLET_PBI, A.TGL,  A.TARGET, 
		DECODE(A.WORKDAY,1,B.TARGET_HARIAN,0)  TARGET_VISIT
	FROM (
		SELECT B.OUTLET_PBI, A.TGL, A.TAHUN, A.BULAN, DECODE(A.WORKDAY,1,B.TARGET_HARIAN,0) TARGET, A.WORKDAY
		FROM WORKDAY_ARIS A, MTARGETMONTH_ARIS B
		WHERE A.TAHUN = B.TAHUN
			AND A.BULAN = B.BULAN
			AND TO_CHAR(A.TGL,'YYYY')=TO_CHAR(SYSDATE,'YYYY')) A, MTARGETMONTH_VISIT_aris B
	WHERE A.OUTLET_PBI = B.OUTLET_PBI(+)
		AND A.TAHUN = B.TAHUN(+)
		AND A.BULAN = B.BULAN(+)