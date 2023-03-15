
SELECT comm, io.pid, round(((read_bytes + write_bytes) * 1e-6), 2) AS total_bytes_mb
FROM processes_io AS io
LEFT JOIN processes_comm AS comm
  ON io.pid = comm.pid
ORDER BY total_bytes_mb DESC
LIMIT 10;
