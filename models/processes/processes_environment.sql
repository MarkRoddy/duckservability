

SELECT
  str_split(filename, '/')[3] AS PID,
  env_pair[1] AS Name,
  env_pair[2] AS Value
FROM ( 
  SELECT
  filename,
    str_split(unnest(str_split(column0, chr(0))), '=') AS env_pair
  FROM read_csv_auto('/proc/[0-9]*/environ', header=False, filename=true, delim='\0')
)
WHERE Name != ''
ORDER BY PID, Name

