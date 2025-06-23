/*p1ex2.sas*/
libname DATA1 "D:\SAS_Datasets";
data testing;
set DATA1.electricity;
where average_temperature>=70;
run;
Proc Print data=testing;
run; 
