libname SAS_Data "D:\SAS_Datasets";
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
title 'The 1st title line';
title2 'The 2nd title line';
run; /*print two title lines */
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
title2 'The NEXT title line';
run; /*only title2 option */
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
title 'The TOP title line';
run; /*only title option */
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
title3 'The 3rd title line';
run; /*only title3 option */
proc print data=SAS_data.electricity;
where scan(Time_period,2,' ')='1:';
title;
run; /* delete all options */
