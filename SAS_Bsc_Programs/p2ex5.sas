data checkformat;
length Day0 $10;
informat Date0 DATE7.;
input Day0 $ Number0 Date0 money0;
datalines;
Wednesday 12345678.91 30Dec2011 12345678.91
;
run;

proc Print data=checkformat;
format Dat0 $3. Date0 Nldate20. Number0 CommaX13.2 Money0 Dollar12.2;
run;
