libname DATA1 "D:\SAS_Datasets";
data testing;
set DATA1.electricity;
where electricity_consumed <= 1000;
run;
Proc Print data=testing;
run;
