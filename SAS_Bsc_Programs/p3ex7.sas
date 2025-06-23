libname DATA1 "D:\SAS_Datasets";
data NEW;
set DATA1.electricity;
x = (average_temperature-32)*5/9;
Drop Average_temperature;
run;

Proc Print data=NEW;
run;
