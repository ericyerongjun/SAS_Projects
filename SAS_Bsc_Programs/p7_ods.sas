ods html close;
Libname SASDATA "D:\SAS_datasets";
ods html path="D:\SAS_Datasets" file="p7_ods_1dest.html";
proc print data=SASDATA.electricity;
run;
ods html close;
ods html; 
libname SASDATA "D:\SAS_Datasets";
ods listing;
ods pdf file="D:\SAS_Datasets\p7_ods_mdest.pdf";
ods rtf path="D:\SAS_Datasets" file="p7_ods_mdest_withpath.rtf";
proc print data=SASDATA.electricity;
run;
ods pdf close;
ods rtf close;
/* Important notes: for html, SAS has to use path and file to generate a html file. For pdf, you should only use file statement. For rtf, you should use path statement. */
