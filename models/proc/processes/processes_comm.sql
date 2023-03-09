

SELECT
  str_split(filename, '/')[3] AS PID,
  trim(replace(column0, chr(0), ' ')) AS comm
FROM read_csv('/proc/[0-9]*/comm', header=False, filename=true, delim='\0', columns={column0: 'VARCHAR'})
ORDER BY PID ASC
