libname DATA1 "D:\SAS_Datasets";
Proc Print DATA = DATA1.electricity (firstobs=11 obs=24);
var time_period electricity_consumed cost average_temperature;
run;
