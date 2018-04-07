CREATE DATABASE coursesdb;
GRANT ALL PRIVILEGES ON coursesdb.* TO 'dev'@'localhost';
USE coursesdb;
CREATE TABLE courses (
  CRSE_ID int,
  ACAD_GROUP varchar(4),
  SUBJECT varchar(3),
  CATALOG_NBR int,
  DSCR varchar(128),
  EFFDT varchar(45),
  EFF_STATUS varchar(1),
  EQUIV_CRSE_ID int,
  CONSENT varchar(1),
  ALLOW_MULT_ENROLL varchar(1),
  UNITS_ACAD_PROG int,
  CRSE_REPEATABLE varchar(1),
  UNITS_REPEAT_LIMIT int,
  CRSE_REPEAT_LIMIT int,
  GRADING varchar(3),
  GRADE_ROSTER_PRINT varchar(1),
  SSR_COMPONENT varchar(3),
  COURSE_TITLE_LONG text,
  COMPONENT_PRIMARY varchar(1),
  DESCRLONG text,
);
