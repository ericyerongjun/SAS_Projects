libname Elect "D:SAS_Datasets";
proc print data=elect.electricity;
run;
data elect.Year1_elect;
set elect.electricity;
if substr(Time_Period,6,2)="1:"
then output elect.Year1_elect;
run;
proc print data = elect.Year1_elect;
run;
data Year1_elect0;
set elect.Year1_elect;
/* Retain is kind of similar to the value assignment in the other programming languages */
retain total_cost 0;
total_cost=total_cost + cost;
run;
proc print data = Year1_elect0;
var cost total_cost;
run;
/* Sum function */
data Year1_elect2;
set elect.Year1_elect;
total_cost+cost;
run;
proc print data=Year1_elect2;
var cost total_cost;
run;
data Year1_elect3;
set elect.Year1_elect;
/* Another syntax of sum function */
total_cost=sum(total_cost,cost);
run;
proc print data=Year1_elect2;
var cost total_cost;
run;
