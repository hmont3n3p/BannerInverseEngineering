 set pagesize 0 linesize 80 feedback off

SELECT 'The database ' || instance_name ||
' has been running since ' || to_char(startup_time, 'HH24:MI MM/DD/YYYY')
FROM v$instance; 

SELECT 'There are ' || count(status) ||
' data files with a status of ' || status
FROM dba_data_files
GROUP BY status
ORDER BY status;

SELECT 'The total storage used by the data files is ' ||
sum(bytes)/1024/1024 || ' MB'
FROM dba_data_files;
