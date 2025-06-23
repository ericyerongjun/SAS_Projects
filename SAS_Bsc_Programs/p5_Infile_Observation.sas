Data work.grad93m;
Infile "D:\SAS_Datasets\AMAgrad93.csv" dlm = "," firstobs = 2 obs = 4;
length First_Name $20 Last_Name $20 Gender $1 Job_Title $ 25 Country $25 Phone $20;
Input Uni_ID First_Name $ Last_Name $ Gender $ DOB:DDMMYY.
 Current_Salary: Dollar. Job_Title $ Country $ Phone $;
Run;
proc print data = work.grad93m;
run;
Data work.grad93m;
 Infile "D:\SAS_datasets\AMAgrad93.DAT" firstobs=2 ;
 Length First_Name $ 20 Last_Name $20 Gender $1
 Job_Title $25 Country $25 Phone $ 20;
Input @1 Uni_ID 8. @9 First_Name $7. @16 Last_Name $6. @22 Gender $1.
@24 DOB:DDMMYY10.
 @34 Current_Salary 7.0 @41 Job_Title $23. @64 Country $11. @75
Phone $14.;
Run;
proc print data = work.grad93m;
run;
proc print data = work.grad93m(obs=3);
where gender = "M";
run;
