# KDB

> Kdb+ is a database.  
> Q is a general-purpose programming language. You can write programs for anything in q.  

## Environment Variables
The q process refers to QHOME, QLIC, and QINIT environment variables at the time of execution. 

- QHOME: It is a path to find a q.k file to bootstrap to execute the q process.
- QLIC: Specifies the license file to be used in the q process. Basically, the QHOME path requires a kc.lic file.
- QINIT: It is a script file to be executed at the root context location after the q.k file is bootstraped, and if this environmental variable is not defined, the q.q file is executed at the QHOME location.

## Tables

- [Learn - Tables](https://code.kx.com/q/learn/startingkdb/tables/)
- [Q for Mortals - Tables](https://code.kx.com/q4m3/8_Tables/)

> It is good practice to specify the types of all columns in an empty table.  
> A keyed table is not a table – it is a dictionary and so has type 99h.  

### Tips

#### If you need an empty table,
it is recommended to use a Take Operator to create an empty table.

```q
system "l start/trades.q"
count trades / trades contain 2500 rows
\ts:10 delete from trades / 0 8560
\ts:10 enlist trades[-1] / 0 768
\ts:10 select from trades where i = -1 / 0 1344
\ts:10 0#trades / 0 704
```

#### If you want to exclude a specific column,
the drop operator is more efficient than the select,delete keyword.

```q
system "l start/trades.q"
{trades,:trades;count trades} each 1+til 10
count trades / trades contain 2560000 rows
\ts:10 select date,time,sym,price from trades / 0 1360
\ts:10 delete size,cond from trades / 0 1056
\ts:10 `size`cond _ trades / 0 912
```

#### If you want a duplicate key table,
you need to create an empty table and then perform an upsert.

```q
system "l start/trades.q"
{trades,:trades;count trades} each 1+til 10
count trades / trades contain 2560000 rows
ktrades:3!trades / convert key table but not duplicated.
count ktrades / 
ektrades:0#ktrades
dktrades:ektrades upsert ktrades
count dktrades / dktrades contains 2499 rows
```