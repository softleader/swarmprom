SELECT
ss.sid "sid",
ss.username "username",
ss.machine "machine",
ss.program "program",
NVL(ss.blocking_session, 0) "blocking_session",
ss.status "status",
se.VALUE/100 "cpu_usage_seconds",
1 "cnt_value"
FROM
v$session ss,
v$sesstat se,
v$statname sn
WHERE ss.username iS NOT NULL
AND se.statistic# = sn.statistic#
AND sn.name like '%CPU used by this session%'
AND se.sid = ss.sid
