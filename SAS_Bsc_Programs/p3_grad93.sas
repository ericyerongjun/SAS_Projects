DATA work.grad93;
    infile "D:\SAS_Datasets\AMAgrad93.csv" dlm="," MISSOVER dsd;
    length Uni_ID $ 20 First_Name $ 20 Last_Name $ 20 Gender $ 1 Job_Title $ 25 Country $ 25 Phone $ 20 Status $ 10;
    input Uni_ID $ First_Name $ Last_Name $ Gender $ DOB : DDMMYY10. Current_Salary : dollar8. Job_Title $ Country $ Phone $;
	format DOB DDMMYY10. Current_Salary dollar8.;
	Monthly_Salary = Current_Salary/12;
	Status="Graduate";
run;
proc print data=work.grad93;
run;
/* Basically, the actual ordering of variale creation in PDV will be the length ordering at the front, and concat by the input statement. For example, the actual order is Uni_ID First_Name Last_Name Gender Job_Title Country Phone (This part is similar to the ordering of length statement)  DOB Current_Salary (The exceeding part with the ordering in the input statement) */
DATA work.part_grad93;
set grad93;
DROP Current_Salary Monthly_Salary Job_Title DOB Country Phone Status;
/* 
KEEP Uni_ID First_Name Last_Name Gender;
KEEP GraduateYr;
*/
GraduateYr = 1993;
run;
Proc Print data = work.part_grad93;
run;
DATA work.part_grad93(DROP=Current_Salary Monthly_Salary Job_Title DOB Country Phone Status);
set grad93;
GraduateYr=1993;
run;
Proc Print DATA = work.part_grad93;
run;
/*
DATA output-SAS-data-set(DROP=variable-list);
DATA output-SAS-data-set(KEEP=variable-list);
SET input-SAS-data-set(DROP=variable-list);
SET input-SAS-data-set(KEEP=variable-list);
*/
