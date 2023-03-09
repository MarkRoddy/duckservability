/*
Limit                     Soft Limit           Hard Limit           Units     
Max cpu time              unlimited            unlimited            seconds   
Max file size             unlimited            unlimited            bytes     
Max data size             unlimited            unlimited            bytes     
Max stack size            8388608              unlimited            bytes     
Max core file size        0                    unlimited            bytes     
Max resident set          unlimited            unlimited            bytes     
Max processes             15630                15630                processes 
Max open files            1048576              1048576              files     
Max locked memory         67108864             67108864             bytes     
Max address space         unlimited            unlimited            bytes     
Max file locks            unlimited            unlimited            locks     
Max pending signals       15630                15630                signals   
Max msgqueue size         819200               819200               bytes     
Max nice priority         0                    0                    
Max realtime priority     0                    0                    
Max realtime timeout      unlimited            unlimited            us
*/


SELECT
  str_split(filename, '/')[3] AS PID,
  trim(row[:26]) AS limit_name,
  trim(row[26:47]) AS soft_limit,
  trim(row[47:68]) AS hard_limit,
  trim(row[68:]) AS units
FROM read_csv('/proc/[0-9]*/limits', header=False, filename=true, skip=1, delim=chr(0),
     columns={row: 'VARCHAR'})
ORDER BY PID ASC

