/* Do - End syntax */
data PI6;
do i = 1 to 6;
deposit + 1000;
deposit + (deposit*1.5/100/12);
end;
run;
options nocenter;
proc print data = PI6;
format deposit Dollar10.2;
run;
/* Do-While syntax */
data PI6;
do while(i<6);
i+1;
deposit + 1000;
deposit + (deposit*1.5/100/12);
output;
end;
run;
proc print data = PI6 label noobs;
format deposit Dollar10.2;
label deposit = "savings";
run;
/* Do - Until syntax */
data PI6;
do until(i>=6);
i+1;
deposit + 1000;
deposit + (deposit*1.5/100/12);
output;
end;
run;
proc print data = PI6 label noobs;
format deposit Dollar10.2;
label deposit = "savings";
run;
data PI_david;
do i = 1 to 20 
while (deposit<10000);
deposit +1000;
deposit+(deposit*1.5/100/12);
output;
end;
run;
data PI_david;
do i = 1 to 20 
until (deposit>=10000);
deposit +1000;
deposit+(deposit*1.5/100/12);
output;
end;
run;
Libname xlsdata "D:\SAS_datasets\planned_saving.xlsx";
data PI3yr (drop=month);
 set xlsdata.'Customers$'n;
 saving =0;
do year=1 to no_of_year;
 do month = 1 to 12;
 saving +Monthly_deposit;
 saving+(saving*1.5/100/12);
 end;
 output;
end;
run;
proc print data=PI3yr label;
var name no_of_year monthly_deposit year saving;
label no_of_year =' No. of years'
 year = 'After year '
 monthly_deposit='Monthly deposit'
 saving='Total saving';
format Monthly_Deposit saving Dollar10.2;
run;
