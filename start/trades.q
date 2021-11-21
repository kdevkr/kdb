/ trades.q
/ example table with random data

trades:([]date:`date$();time:`time$();sym:`symbol$();price:`real$();size:`int$();cond:`char$())

syms:`IBM`MSFT`UPS`BAC`AAPL
tpd:100              / trades per day
day:5                / number of days
cnt:count syms       / number of syms
len:tpd*cnt*day      / total number of trades
date:2013.07.01+len?day
time:"t"$raze (cnt*day)#enlist 09:30:00+15*til tpd
time+:len?1000
sym:len?syms
price:len?100e
size:100*len?1000
cond:len?" ABCDENZ"

trades:0#trades      / empty trades table
`trades insert (date;time;sym;price;size;cond)
trades:`date`time xasc trades  / sort on time within date
5#trades