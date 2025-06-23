libname xlsdata 'd:\SAS_datasets\polyu_overseas_staff.xlsx';
/* produce one way tables for all variables in the data sets
*/
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
Tables _ALL_;
run;
/* produce one way table for gender and origin_country in the datasets */
proc freq data = xlsdata."PolyU_overseas_staff$"n;
tables gender origin_country;
run;
/* using the asterisk * to create a two way table */
proc freq data = xlsdata."PolyU_overseas_staff$"n;
tables gender *origin_country;
run;
/* using page function to seperate the tables into different pages */
proc freq data = xlsdata."PolyU_overseas_staff$"n PAGE;
tables gender origin_country;
run;
/* using Compress function to compress the data */
proc freq data = xlsdata."PolyU_overseas_staff$"n COMPRESS;
tables gender origin_country;
run;
/* using NLEVELS function to show levels */
proc freq data = xlsdata."PolyU_overseas_staff$"n NLEVELS;
tables gender origin_country;
run;
/* using CHISQ function to do the chi-square test with degree of freedom and p-value */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender origin_country /chisq;
run;
/* Suppress the display of cumulative frequency and cumulative percentage (only for ONE­way table) */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender origin_country /NOCUM;
run;
/* Suppress the display of percentage, cumulative percentage and total percentage (only for ONE­way table) */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender origin_country /NOPERCENT;
run;
/* Suppress the display of the cell frequency and total frequency (NOT for one­way table) */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender *origin_country /NOFREQ;
run;
/* Suppress the display of the row percentage (NOT for ONEWAY table) */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender *origin_country /NOROW;
run;
/* Suppress the display of the column percentage (NOT for ONE­WAY table) */
proc freq data = xlsdata."PolyU_overseas_staff$"n ;
tables gender origin_country /NOCOL;
run;
/* Display n-way tables in the list format */
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender *origin_country / LIST;
run; 
/* Display n­way tables in column format (almost same as LIST but with sub­totals) */
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender *origin_country / CROSSLIST;
run; 
/* Format the frequencies in n­way tables */
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender *origin_country / Format=10.3;
run; 
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender origin_country /out=OUT_origin_country;
run; 
proc print data=OUT_origin_country;
run; 
/*  Include the cumulative frequency and cumulative percentage in the output data set for ONE­WAY frequency tables */
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender origin_country /out=OUT_origin_country outcum;
run;
proc print data=OUT_origin_country;
run;
/* Include the percentage of column frequency and row frequency in the output data set for n­way (n>1) frequency tables */
proc freq data=xlsdata.'PolyU_overseas_staff$'n;
 tables gender*origin_country /out=OUT_2_way outpct;
run;
proc print data=OUT_2_way; 
run;
/* output with Chi-square test for one-way table */
proc freq data=xlsdata."PolyU_overseas_staff$"n;
 tables gender origin_country /chisq;
 OUTPUT OUT=output_1_way chisq;
run; 
/* output with chi-square test for two-way table */
proc freq data=xlsdata."PolyU_overseas_staff$"n;  
tables gender*origin_country /chisq;
OUTPUT OUT=output_2_way chisq;
run;


