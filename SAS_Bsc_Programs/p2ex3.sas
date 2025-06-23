libname DATA1 "D:\SAS_Datasets";

DATA subset_electricity;
length time_period $17;
input time_period & $ @24 electricity_consumed cost heating_degree_days average_temperature;
datalines;
Year 1: Jan/Feb         3637 2975.33 2226 29
Year 1: March/Apr       2888 230.08 1616 37
Year 8: Sept/oct        2710 329.72 228 .
Year 8: Nov/Dec         2327 229.05 1053 .
;
run;
Proc Print DATA= subset_electricity;
run;
