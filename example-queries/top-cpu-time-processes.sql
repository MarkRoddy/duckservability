
SELECT
  comm, cpu.pid, round((cputime_ns * 1e-6), 2) AS cputime_ms
FROM processes_schedstat AS cpu
LEFT JOIN processes_comm AS comm
  ON cpu.pid = comm.pid
ORDER BY cputime_ns DESC
LIMIT 10;
