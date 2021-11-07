/ tables.q
/ https://code.kx.com/q4m3/8_Tables/
/ https://code.kx.com/q/learn/startingkdb/tables/

/ If you need an empty table,
system "l start/trades.q"
{trades,:trades;count trades} each 1+til 10
count trades / trades contain 2560000 rows
\ts:10 delete from trades / 5 8388976
\ts:10 enlist trades[-1] / 0 768
\ts:10 select from trades where i = -1 / 0 1344
\ts:10 0#trades / 0 704

/ If you want to exclude a specific column, 
system "l start/trades.q"
{trades,:trades;count trades} each 1+til 10
count trades / trades contain 2560000 rows
\ts:10 select date,time,sym,price from trades / 0 1360
\ts:10 delete size,cond from trades / 0 1056
\ts:10 `size`cond _ trades / 0 912

/ If you want a duplicate key table,
ktrades:3!trades / convert key table but not duplicated.
count ktrades / ktrades contain 2560000 rows
ektrades:0#ktrades
dktrades:ektrades upsert ktrades / 2499
count dktrades / dktrades contain 2499 rows

\ts:10 ektrades upsert ktrades / 2335 335544784
\ts:10 ektrades,: ktrades / 1012 335544656

/ It is good practice to specify the types of all columns in an empty table.
data: ([uuid:"s"$();timestamp:"p"$()]date:"d"$();val:"f"$();modified_at:"p"$());
update `g#uuid,`s#timestamp from `data
meta data
/ c          | t f a
/ -----------| -----
/ uuid       | s   g
/ timestamp  | p   s
/ date       | d    
/ val        | f    
/ modified_at| p   