Data Salesvol;
 length name $15;
 infile 'd:\SAS_datasets\sales_vol.csv' dlm=',';
 input name Quarter1-Quarter4;
 array Sales_vol{*} Quarter:;
 array Diff{3};
 array SalesMinTarget{4} _temporary_ (10,10,10,15);
 array Diff_Target{4};
 do i=1 to dim(Sales_vol)-1;
 Diff{i}=Sales_vol{i+1}-Sales_vol{i};
 end;
 do i =1 to dim(Sales_vol);
 Diff_Target{i}=Sales_vol{i} - SalesMinTarget{i};
 end;
 Drop i;
run;
options ls=100;
proc print data=SalesVol;
var name Quarter1-Quarter4 Diff1-Diff3 Diff_target1-Diff_target4;
format Diff1-Diff3 Diff_target1-Diff_target4 Quarter1-Quarter4 3.;
run;
