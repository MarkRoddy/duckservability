/*
$ cat /proc/45399/status
Name:	systemd
Umask:	0002
State:	S (sleeping)
Tgid:	45399
Ngid:	0
Pid:	45399
PPid:	1
TracerPid:	0
Uid:	4000	4000	4000	4000
Gid:	4000	4000	4000	4000
FDSize:	256
.....
*/


SELECT
  str_split(filename, '/')[3] AS PID,
  /* Note that some of the 'value' fields have ':' chars in them. That's
     why we manually parse the tag/value in the select statement, and not
     via the read_csv() function.
     */
  trim(str_split(row, ':')[1]) AS tag,
  trim(array_slice(row, instr(row, ':')+1, null)) AS value,
FROM read_csv('/proc/[0-9]*/status', header=False, filename=true, delim=chr(0),
     columns={row: 'VARCHAR'})
ORDER BY PID, tag ASC
