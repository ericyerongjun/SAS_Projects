libname xlsdata "D:\SAS_datasets\PolyU_overseas_staff.xlsx";
options ls=70;
proc print data=xlsdata.'PolyU_overseas_staff$'n;
*select variables;
var Staff_ID First_Name Last_Name Gender Origin_Country;
*select observations;
where origin_country='AU';
run;
proc sort data=xlsdata."PolyU_overseas_staff$"n
out=polyu_staff;
by origin_country;
run;
proc print data=polyu_staff;
var Staff_ID First_Name Last_Name origin_country;
by origin_country;
run; 
proc print data=polyu_staff label;
var Staff_ID First_Name Last_Name gender salary
origin_country;
where origin_country='AU' and gender='F';
label Staff_ID ='Staff no.'
 First_Name='First Name'
 Last_Name='Last Name'
 gender='Gender'
 origin_country='Country of Origin'
 salary='Monthly Salary';
Format salary DOLLAR10.;
run;
