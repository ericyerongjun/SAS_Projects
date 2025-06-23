libname INLIB "D:\SAS_Datasets";
libname tempxls "D:\SAS_Datasets\output.xls";

Proc copy IN = INLIB  OUT = tempxls;
select electricity chmovie;
run;

libname INLIB clear;
libname tempxls clear;
