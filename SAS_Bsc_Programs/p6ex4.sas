DATA work.datax;
input CKey A B;
datalines;
1 100 202
3 300 404
;
run;

DATA work.datay;
length C $2;
input Ckey C $;
datalines;
1 C1
2 C2
;
run;

DATA new;
merge datax (IN = x) datay (IN = y);
by CKey;
if CKey = 2 or CKey = 3;
run;

proc print data = new;
run;
