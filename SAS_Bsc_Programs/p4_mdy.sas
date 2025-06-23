DATA abc;
Join_Date = MDY(7, 31, 1997);
run;
proc print DATA=abc;
format Join_Date DDMMYY.;
run;
