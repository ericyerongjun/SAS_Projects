DATA INV_DATA V_DATA;
infile "D:\SAS_Datasets\AMAGrad93.csv" dlm=",";
length First_Name $ 20 Last_Name $ 20 Gender $ 1 Job_Title $ 25 Country $ 25 Phone $ 20;
input Uni_ID First_Name $ Last_Name $ Gender $ DOB: DDMMYY. Current_Salary: dollar. Job_Title $ Country $ Phone $ Join_Date : DDMMYY.;
if _ERROR_ = 1
then output INV_DATA;
else output V_DATA;
run;
Proc Print data = V_DATA;
run;
Proc Print data = INV_DATA;
run;
/* combine the valid and invalid data */
Proc append BASE=V_DATA DATA=INV_DATA;
run;
Proc freq DATA = V_DATA;
table gender country job_title;
run;
Proc freq DATA = V_DATA NLEVELS;
table gender country job_title;
run;
proc freq DATA = V_DATA;
table country*gender;
run;
proc print DATA=V_DATA;
where gender NE "F" and gender NE "M";
run;
proc univariate DATA=V_DATA;
var Current_Salary;
run;
proc print DATA=V_DATA;
var First_Name Last_Name Current_Salary;
where Current_Salary < 0 or Current-Salary = 34567;
run;
proc means DATA=V_DATA;
var Current_Salary;
run;
DATA wrong_logic OK_logic;
set V_DATA;
if DOB>Join_Date 
then output wrong_logic;
else output OK_logic;
run;
proc print DATA=wrong_logic;
var First_Name Last_Name DOB Join_Date;
format DOB Join_Date DDMMYY9.;
run;
DATA C_DATA;
set Work.V_DATA;
if gender="W"
then gender="F";
if gender="G"
then gender="F";
country=Propcase(country);
if Join_Date = MDY(8,1,1938)
then Join_Date = MDY(8, 1, 1998);
If _N_=6
then Join_Date = MDY(7, 17, 1998);
if _N_ = 7
then do;
Current_Salary = 20000;
Job_Title = "Programmer";
Join_Date = MDY(9,9,1997);
end;
run;
proc print DATA=C_DATA;
format DOB Join_Date DDMMYY.;
run;

