/ timestamp.q

"P"$"00000000000" / = 1970.01.01D00:00:00.000000000

/ {1000j*floor((`long$x) - `long$1970.01.01D00:00)%1e9}
timestampToEpoch:{{`long$x%1e6}x - `timestamp$1970.01.01}
toEpoch:{x:$[14h = abs type x;x + 00:00:00.000;x];timestampToEpoch x}
currentTimeMillis:{timestampToEpoch .z.p}

/ For examples
currentTimeMillis[] / 1636966758976

/ (.z.d - 1;.z.d) / 2021.11.14 2021.11.15
timestampToEpoch {x-0D09:00}(.z.d - 1;.z.d) / 1636815600000 1636902000000

