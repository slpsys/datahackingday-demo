CREATE TABLE drug_pairs_intermediate AS 
	SELECT d1.ISR, d1.NAME NAME1, d1.DRUG_SEQ SEQ1, d2.NAME NAME2, d2.DRUG_SEQ SEQ2 
	FROM drugs d1 
	JOIN drugs d2 
		ON d1.ISR = d2.ISR
