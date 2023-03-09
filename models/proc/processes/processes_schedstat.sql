/*
$ cat /proc/45399/schedstat 
189497057 49271715 227

*/


SELECT
  str_split(filename, '/')[3] AS PID,
  cputime_ns,
  runqueue_ns,
  num_timeslices,
FROM read_csv('/proc/[0-9]*/schedstat', header=False, filename=true, delim=' ',
     columns={cputime_ns: 'HUGEINT', runqueue_ns: 'HUGEINT', num_timeslices: 'HUGEINT'})
ORDER BY PID ASC
