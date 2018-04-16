set showmode off echo off
set heading off pagesize 0 timing off feedback off linesize 80
set trimspool on termout off verify off
rem
rem Script: collector.sql
rem
rem Purpose: Get the list of collector tables for collector.shl.
rem    You must be logged in as SYS or SYSTEM or as a DBA user ID.
rem
rem Author: Stephen Rea <srea1957@maristream.com>
rem    Maristream, Inc.
rem
rem History:
rem    8/21/01: Original Version.
rem
spool collector.tables
select distinct upper(table_name) from dba_tab_comments
  where owner not in ('SYS','SYSTEM','SCOTT')
  and lower(comments) like '%collector%';
spool off
set pagesize 24 linesize 80 heading on termout on
set timing on feedback 6 verify on echo on showmode both
exit
