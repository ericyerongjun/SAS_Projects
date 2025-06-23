libname DATA1 "D:\SAS_Datasets";
data staffs;
length First_Name $ 20 Last_Name $ 20 Gender $ 1 Salary $ 7 Rank $ 2 Origin $ 2 DOB $ 9 Hire_Date $ 8;
infile "PolyU_ovetrseas_staff.csv" dlm = ",";
input First_Name $ Last_Name $ Gender $ Salary $ Rank $ Origin $ DOB $ Hire_Date;
run;
Proc Print data=staffs;
run;
