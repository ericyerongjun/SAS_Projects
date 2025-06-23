libname xlsdata "D:\SAS_Datasets\PolyU_overseas_staff.xlsx";
proc means data = xlsdata."PolyU_overseas_staff$"n;
run;
proc means data = xlsdata."PolyU_overseas_staff$"n;
var salary;
class gender origin_country;
run;
/* max decimal places is set and observations are not printed */
proc means data=xlsdata.'Polyu_overseas_staff$'n nonobs
maxdec=1;
var salary;
class gender origin_country;
run; 
/* field width displayed */
proc means data=xlsdata.'Polyu_overseas_staff$'n nonobs fw=14 ;
var salary;
class gender origin_country;
run; 
/* Statistics options with coefficient of variation, median and t_value */
proc means data=xlsdata.'Polyu_overseas_staff$'n CV Median t ;
var salary;
class gender origin_country;
run; 
/* output to file */
proc means data=xlsdata.'Polyu_overseas_staff$'n;
var salary;
class gender origin_country;
output out=out_mean;
run;
proc print data=out_mean;
run; 
/* output to file and renaming statistics */
proc means data=xlsdata.'Polyu_overseas_staff$'n;
var salary;
class gender origin_country;
output out=out_mean1 min=minsalary max=maxsalary sum=totalsalary;
run;
proc print data=out_mean1;
run;
proc format;
 value $countrycode "AU"="Australia"
 "US"="United State"
 "UK"="United Kingdom"
 "DE"="Germany";
run;
options nocenter ls=130;
proc means data=xlsdata.'Polyu_overseas_staff$'n;
var salary;
class gender origin_country;
where rank="Professor";
format origin_country $countrycode.;
title "Professor gender and country of origin summary report";
run; 

