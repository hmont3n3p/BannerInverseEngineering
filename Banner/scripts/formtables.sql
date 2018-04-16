set showmode off echo off
set heading off pagesize 0 timing off feedback off linesize 80
set trimspool on termout off verify off
rem
rem Script: formtables.sql
rem
rem Purpose: Get the list of non-system tables for formtables.shl.
rem    You must be logged in as SYS or SYSTEM or as a DBA user ID.
rem
rem Author: Stephen Rea <srea1957@maristream.com>
rem    Maristream, Inc.
rem
rem History:
rem    9/16/99: Original Version.
rem    9/21/99: Exclude user tables.
rem    9/23/99: Exit at end for running from formtables.shl.
rem    6/25/02: Add switch (include_views) to include views in
rem             addition to the tables, if wanted.
rem
define include_views=n
rem
spool formtables.tables
SELECT DISTINCT OBJECT_NAME
FROM
  (SELECT UPPER(OBJECT_NAME)OBJECT_NAME
  FROM all_objects
  WHERE owner NOT IN ('SYS','SYSTEM','SCOTT')
  AND OBJECT_TYPE  ='TABLE'
  AND STATUS       ='VALID'
  AND OBJECT_NAME LIKE 'SW%'
  UNION ALL
  SELECT UPPER(OBJECT_NAME)OBJECT_NAME
  FROM all_objects
  WHERE owner NOT IN ('SYS','SYSTEM','SCOTT')
  AND OBJECT_TYPE  ='TABLE'
  AND STATUS       ='VALID'
  AND OBJECT_NAME  NOT LIKE 'SW%'
  ) WHERE ROWNUM<=24;
spool off
set pagesize 24 linesize 80 heading on termout on
set timing on feedback 6 verify on echo on showmode both
exit
