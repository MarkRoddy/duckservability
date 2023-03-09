
/* Note! Due to a race condition between DuckDB performs the glob operation and
   when the underlying process closes the file, it is likely queries to this model
   would fail because a file at glob time does not exist at file open time. To get
   around this we limit the FD glob pattern to [0-2], that way it will only match
   stdin, stdout, and stderr. Which... in theory are stable? Note that these could
   still go away in theory, but this has not yet been observed in practicce.
*/
SELECT
  str_split(filename, '/')[3] AS PID,
  str_split(filename, '/')[6] AS fd,
  str_split(row, ':')[1] AS tag,
  /* Note you may be tempted to convert these to ints, non-int
     values are legal here even if you don't see them! If you're
     going to do so, you'll need to find a way to filter on *type*
     of file the fd refers to, as the 'value' field changes on this. */
  trim(array_slice(row, instr(row, ':')+1, null)) AS value
FROM read_csv('/proc/[0-9]*/fdinfo/[0-2]', header=False, filename=true, delim='\0',
     columns={row: 'VARCHAR'})
ORDER BY PID ASC
