CREATE DATABASE IF NOT EXISTS hr;
USE hr;

DROP TABLE IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));

DROP TABLE IF EXISTS JOB_HISTORY;
CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
                            
DROP TABLE IF EXISTS JOBS;
CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(50) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

DROP TABLE IF EXISTS DEPARTMENTS;
CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

DROP TABLE IF EXISTS LOCATIONS;
CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));

-- Truy vấn 1
SELECT      *
FROM        EMPLOYEES
WHERE       ADDRESS LIKE '%Elgin,IL%';
-- Truy vấn 2
SELECT      *
FROM        EMPLOYEES
WHERE       `B_DATE` LIKE '197%';
-- Truy vấn 3
SELECT      *
FROM        EMPLOYEES
WHERE       `DEP_ID` = 5 AND `SALARY` BETWEEN 60000 AND 70000;
-- Truy vấn 4A
SELECT      *
FROM        EMPLOYEES
ORDER BY    `DEP_ID`;
-- Truy vấn 4B
SELECT      *
FROM        EMPLOYEES
ORDER BY    `DEP_ID`, L_NAME DESC;
-- Truy vấn 5A
SELECT      DEP_ID, COUNT(DEP_ID)
FROM        EMPLOYEES
GROUP BY    DEP_ID;
-- Truy vấn 5B
SELECT      DEP_ID, COUNT(DEP_ID), AVG(SALARY)
FROM        EMPLOYEES
GROUP BY    DEP_ID;
-- Truy vấn 5C
SELECT      DEP_ID, COUNT(DEP_ID) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM        EMPLOYEES
GROUP BY    DEP_ID;
-- Truy vấn 5D
SELECT      DEP_ID, COUNT(DEP_ID) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY
FROM        EMPLOYEES
GROUP BY    DEP_ID
HAVING      COUNT(`DEP_ID`) < 4
ORDER BY    AVG_SALARY;
