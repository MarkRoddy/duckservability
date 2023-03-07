

SELECT
  *
FROM read_csv_auto('/etc/passwd', header=False, delim=':', columns = { 'Username': 'VARCHAR', 'Password': 'VARCHAR', 'UserID': 'INT', 'GroupID': 'INT', 'Comment': 'VARCHAR', 'HomeDir': 'VARCHAR', 'Shell': 'VARCHAR' })
