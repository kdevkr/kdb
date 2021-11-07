/ commands.q

\c 300 300 / Console maximum rows and columns
\P 0 / use maximum precision.
\t 1000 / Enable timer interval with 1s
\T 60 / The client execution timeout set 60s

/ q -p 5000 -pidfile q.pid
argv:.Q.def[`whoami`logdst`pidfile!(`mambo;`$("logs/q.log");`)].Q.opt .z.x
/ whoami | mambo
/ logdst | logs/q.log
/ pidfile| q.pid

/ If you want to create a process ID file,
pid:.z.i
pidfile:argv[`pidfile]
$[pidfile <> `;`$":",string pidfile 0: enlist string pid;`e]