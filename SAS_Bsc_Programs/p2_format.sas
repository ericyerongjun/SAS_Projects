libname data1 "D:\SAS_Datasets";
proc format;
value temp_range 20 - < 41 = "Low"
41 - 55 = "Middle"
56 - HIGH = "High"
. = "Missing";
run;

proc Print data = data1.electricity;
format electricity_consumed Comma5. cost Dollar7.2 average_temperature temp_range.;
run;
