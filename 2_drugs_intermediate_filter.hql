CREATE TABLE drug_pairs AS 
	SELECT * 
	FROM drug_pairs_intermediate 
	WHERE SEQ1 < SEQ2
