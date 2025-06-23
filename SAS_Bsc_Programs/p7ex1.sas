libname SAS_data "D:\SAS_datasets";
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
where scan(Time_period,2,' ')='2:';
where scan(Time_period,2," ") = "1:" or scan(Time_period,2," ") = "2:";
run;
