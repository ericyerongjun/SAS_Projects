libname Elect "D:\SAS_Datasets";
data Elect.electricityCYr;
length Period $8;
set Elect.electricity;
Period = substr(Time_Period,1,6);
run;
proc sort data = elect.electricityCyr;
by period;
run;
data electricitycyr;
set elect.electricitycyr;
by period;
if First.period then total_cost=0;
total_cost+cost;
run;
proc print data = electricitycyr;
var time_period period cost total_cost;
run;
data Sum_electricitycyr(keep=period total_cost);
set elect.electricitycyr;
by period;
if First.period then total_cost=0;
total_cost+cost;
if Last.period;
run;
proc print data = sum_electricitycyr;
run;
data Elect.electricityCYr2;
length Period $8 Half_Year $13;
 set Elect.electricity;
 Period=Substr(Time_period,1,6);
 if UPCASE(Substr(Time_period,9,3)) eq 'JAN' or
 UPCASE(Substr(Time_period,9,3)) eq 'MAR' or
 UPCASE(Substr(Time_period,9,3)) eq 'MAY'
then Half_Year='1st half year';
else Half_Year='2nd half year';
/* to delete the year 2: Jan to Jun data*/
if Period='Year 2' and Half_Year='1st half year' then delete;
run;
proc print data=Elect.electricityCYr2;
run;
proc sort data=elect.electricityCYr2;
by period half_year;
run;
