#!/bin/bash

# Replace with actual files (depending on data source), remove header
awk 'FNR>2' DEMO11Q3.TXT > DEMO11Q3_noheader.csv
awk 'FNR>2' REAC11Q3.TXT > REAC11Q3_noheader.csv
awk 'FNR>2' DRUG11Q3.TXT > DRUG11Q3_noheader.csv

hive -e "CREATE TABLE DRUGS (isr bigint, drug_seq bigint, role string, name string, vbm bigint, route string, dose_vbm string, dechal string, rechal string, lot bigint, exp_dt string, nda bigint) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE; load data local inpath 'DRUG11Q3_noheader.csv' into table drugs;"

hive -e "create table DEMOS (isr bigint, case_no int, if_cod string, foll_seq string, image string, event_dt string, mfr_dt string, fda_dt string, rept_code string, mfr_num string, mfr_sndr string, age bigint, age_code string, gender string, e_sub string, weight bigint, wt_code string, rept_dt string, occp_code string, death_dt string, to_mfr string, confid string, reporter_country string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE; load data local inpath 'DEMO11Q3_noheader.csv' into table demos;"

hive -e "create table REACS (isr bigint, code string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE; load data local inpath 'REAC11Q3_noheader.csv' into table reacs;"

