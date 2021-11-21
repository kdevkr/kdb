date_trunc_day:{d:$[-19h = type x;.z.d;`date$x];parse(string d),"D00:00"}
date_trunc_hour:{d:$[-19h = type x;.z.d;`date$x];parse(string d),("D",("0"^-2$string`hh$x),":00")}
date_trunc_minute:{d:$[-19h = type x;.z.d;`date$x];parse(string d),("D",":" sv "0"^-2$string`hh`uu$x)}
date_trunc_second:{d:$[-19h = type x;.z.d;`date$x];parse(string d),("D",":" sv "0"^-2$string`hh`uu`ss$x)}
date_trunc:{[dp;ts]
	if[not dp in (`day`hour`minute`second);'`datepart];
	if[dp = `day;:date_trunc_day ts];
	if[dp = `hour;:date_trunc_hour ts];
	if[dp = `minute;:date_trunc_minute ts];
	if[dp = `second;:date_trunc_second ts]}

/ examples
/ date_trunc[`day;].z.p
/ date_trunc[`hour;].z.p
/ date_trunc[`minute;].z.p
/ date_trunc[`second;].z.p