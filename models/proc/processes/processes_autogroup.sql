

SELECT
  str_split(filename, '/')[3] AS PID,
  task_group,
  nice
FROM read_csv('/proc/[0-9]*/autogroup', header=False, filename=true, delim=' ',
              columns={task_group: 'VARCHAR', huh: 'VARCHAR', nice: 'INT'})
ORDER BY PID ASC
