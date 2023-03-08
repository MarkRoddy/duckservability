-- hierarchy-ID:controller-list:cgroup-path



SELECT
  str_split(filename, '/')[3] AS PID,
  hierarchy_id,
  controller_list,
  cgroup_path
FROM read_csv('/proc/[0-9]*/cgroup', header=False, filename=true, delim=':',
     columns={hierarchy_id: 'VARCHAR', controller_list: 'VARCHAR', cgroup_path: 'VARCHAR'})
ORDER BY PID ASC

