libname SAS_data "D:\SAS_Datasets";
/* testing macro */
options ls=65;
%let currentdate=%sysfunc(today(),worddate.);
%let currenttime=%sysfunc(time(),timeampm.);
proc print data=SAS_data.electricity;
where scan(Time_period,2," ")="1:";
title1 " Electricity Consumption Data for Year 1";
title2 "created on &currentdate";
title3 "at &currenttime";
run; 
