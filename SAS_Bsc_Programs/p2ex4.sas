libname DATA1 "D:\SAS_Datasets";

data TEMPMISS;
set DATA1.electricity;
where average_temperature IS MISSING;
run;

Proc Print DATA = TEMPMISS;
run;

data DATA1.Cost_Temp;
set data1.electricity;
where (cost <= 300) and (average_temperature between 41 and 70);
run;

proc Print data = DATA1.Cost_Temp;
run;

Data DATAYEAR1;
set DATA1.electricity;
where Time_Period CONTAINS "Year 1";
run;

Proc Print DATA=DATAYEAR1;
run;
