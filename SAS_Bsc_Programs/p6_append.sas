libname ama "D:\SAS_Datasets";
/* Appending a dataset */
/* Like datasets appending without force option */
proc append base = AMA.grad data = ama.grad11;
run;
proc print data = AMA.grad;
run;
/* Unlike datasets appending with force option */
proc append base = AMA.grad data = AMA.grad11m force;
run;
proc print data = AMA.grad;
run;
data AMA_grad_a;
  length Name $10 Gender $1 GradYr 2;
  input Name $ Gender $ GradYr;
  datalines;
  John M 10
  Peter M 10
  kitty F 10
;
run;

proc print data=AMA_grad_a;
run;
data AMA_grad_b;
length Name $10 Gender $1 GradYr 2;
  Name = "John";
  Gender = "M";
  GradYr = 10;
  output;
  Name = "Peter";
  Gender = "M";
  GradYr = 10;
  output;
  Name = "Kitty";
  Gender = "F";
  GradYr = 10;
  output;
run;

proc print data=AMA_grad_b;
run;
/* Concatenating datasets */
data ama.allgrad;
set ama.grad ama.grad11;
run;
data ama.allgrad_a;
set ama.grad ama.grad11a(RENAME = (GYr = GradYr));
run;
DATA ama.allgrad_sorted;
set ama.grad ama.grad11a(RENAME = (GYr = GradYr));
/* With BY, The variables are sorted with descending order */
BY Name;
run;
data visit;
 length Last_Name $20 First_Name $20 Gender $1 Resid_District
$20 Home_country $20 Project_Field $20 Visit_country $20;
 infile 'd:\SAS_datasets\AMAYr3visit.csv' dlm=',';
 Input Uni_no First_name $ Last_name $Gender $Telephone
Resid_District $ Home_country $ Project_Field $ Visit_country;
run;
*output to work.sorted_vist;
proc sort data=visit out=sorted_visit;
by Uni_no;
run;
*replaces observations in work. visit;
proc sort data=visit;
by Uni_no;
run;
* print out Uni_no First_Name Last_Name Gender Project_field of
Work.visit;
proc print data=visit;
var Uni_no First_Name Last_Name Gender Project_field;
run;
