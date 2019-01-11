-- /test/resources/ setup of testing data in SDE source
-- this is not a comprehensive creator of all oracle schema objects
-- these fun ones are not registered with SDE and are not spatial
-- so we can EZcreate them with DDL and insert data with DML
-- no need for _scratch datasets in postgres and SHP interchanges
--condo_units (may be registered with SDE, not sure if important)
--air_label
--condo_label
--sub_label
BEGIN
    BEGIN
       EXECUTE IMMEDIATE 'DROP TABLE CONDO_UNITS';
    EXCEPTION
    WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE CONDO_UNITS (	
     objectid           NUMBER 
	,condo_boro         VARCHAR2(1) NOT NULL
	,condo_number       NUMBER(5,0) NOT NULL 
	,condo_key          NUMBER(10,0) 
	,condo_base_boro    VARCHAR2(1) 
	,condo_base_block   NUMBER(10,0) 
	,condo_base_lot     NUMBER(5,0) 
	,condo_base_bbl     VARCHAR2(10) 
	,condo_base_bbl_key VARCHAR2(15) 
	,unit_boro          VARCHAR2(1) NOT NULL
	,unit_block         NUMBER(10,0) NOT NULL 
	,unit_lot           NUMBER(5,0) NOT NULL 
	,unit_bbl           VARCHAR2(10) 
	,created_by         VARCHAR2(50) 
	,created_date       DATE 
	,last_modified_by   VARCHAR2(50) 
	,last_modified_date DATE 
	,av_change          NUMBER(5,0)
	,bw_change          NUMBER(5,0) 
	,effective_tax_year VARCHAR2(50) 
	,unit_designation   VARCHAR2(10)
	,globalid           CHAR(38) NOT NULL
    ,CONSTRAINT CONDO_UNITS_PK PRIMARY KEY (OBJECTID) --name doesnt match real 
    )';
    BEGIN
       EXECUTE IMMEDIATE 'DROP TABLE AIR_LABEL';
    EXCEPTION
    WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE AIR_LABEL (
     bbl                VARCHAR2(10)
    ,label              VARCHAR2(200) NOT NULL
    ,"COUNT"            NUMBER NOT NULL
    )';
    EXECUTE IMMEDIATE 'CREATE INDEX AIR_LABEL_BBL ON AIR_LABEL(bbl)';
    BEGIN
       EXECUTE IMMEDIATE 'DROP TABLE CONDO_LABEL';
    EXCEPTION
    WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE CONDO_LABEL (
     bbl                VARCHAR2(10)
    ,label              VARCHAR2(200) NOT NULL
    ,"COUNT"            NUMBER NOT NULL
    )';
    EXECUTE IMMEDIATE 'CREATE INDEX CONDO_LABEL_BBL ON CONDO_LABEL(bbl)';
    BEGIN
       EXECUTE IMMEDIATE 'DROP TABLE SUB_LABEL';
    EXCEPTION
    WHEN OTHERS THEN NULL;
    END;
    EXECUTE IMMEDIATE 'CREATE TABLE SUB_LABEL (
     bbl                VARCHAR2(10)
    ,label              VARCHAR2(200) NOT NULL
    ,"COUNT"            NUMBER NOT NULL
    )';
    EXECUTE IMMEDIATE 'CREATE INDEX SUB_LABEL_BBL ON SUB_LABEL(bbl)'; 
END;