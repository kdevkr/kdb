/ int.q
/ int is partition domain for Hourly partitioning.

/ The hour function converts the datetime into int values for time.
/ based on {`int$sum 24 1*@[;0;-;1970.01.01] `date`hh$\:x}
hour:{x:$[-14h=type x;x+0D00:00;x];`int$sum 24 1*@[;0;-;1970.01.01] `date`hh$\:x}

intToTimestamp:{1970.01.01+`timespan$1e6*x*60*60*1000}
intToDate:{1970.01.01+x div 24}

/ For examples
/ truncate timestamp using int functions.
.z.p / 2021.11.15D08:24:39.238003000
intToTimestamp hour intToDate hour .z.p / 2021.11.15D00:00:00.000000000

/ int range in date.
intToTimestamp {(x;x+24)} hour .z.d / 2021.11.15D00:00:00.000000000 2021.11.16D00:00:00.000000000
/ int range in date with KST offset.
(intToTimestamp {(x;x+24)} hour .z.d) - 0D09:00 / 2021.11.14D15:00:00.000000000 2021.11.15D15:00:00.000000000
