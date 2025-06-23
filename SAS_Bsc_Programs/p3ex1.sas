libname xls "D:\SAS_Datasets\electricity.xls";
data Years1;
set xls.'Year1-4$'n;
run;

data Years2;
set xls.'year5-8$'n;
run;

proc contents data=work._all_;
run;
