/* Using multiple input to input the raw data */
data address1;
 infile 'd:\SAS_datasets\address.txt' ;
 input Fullname $30.;
 input Address1 $48.;
 input Address2 $48.;
 input District $20.;
 input Country $30.;
run;
proc print data=address1;
run;
/* INPUT statement without a variable list means skipping a line during reading a dataset */
data address2;
 infile 'd:\SAS_datasets\address.txt' ;
 input Fullname $30.;
 input;
 input Address2 $48.;
 input District $20.;
 input Country $30.;
run;
proc print data=address2;
run;
/* Using slash / to make specifications */
data address3;
 infile 'd:\SAS_datasets\address.txt';
 input Fullname $30. /
 Address1 $48. /
 Address2 $48. /
 District $20. /
 Country $30.;
run;
proc print data=address3;
run;
data address4;
 infile 'd:\SAS_datasets\address.txt';
 input Fullname $30. /
 / /
 District $20. /
 Country $30.;
run;
proc print data=address4;
run;
/* Using hash # to make specifications */
data address5;
 infile 'd:\SAS_datasets\address.txt';
 input #1 Fullname $30.
 #4 District $20.
 #5 Country $30.;
run;
proc print data=address5;
run;  
