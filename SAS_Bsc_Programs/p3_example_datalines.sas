/* @@ should be added if there are more than one observation in a single line to print out all the observations */-
data test;
 input name $ age @@;
 datalines;
John 13 Monica 12 Sue 15 Stephen 10
Marc 22 Lily 17
;
run;
data test1;
 input name $ age ;
 datalines;
John 13 Monica 12 Sue 15 Stephen 10
Marc 22 Lily 17
; 
run;
Proc Print data = test;
run;
proc Print data = test1;
run;
