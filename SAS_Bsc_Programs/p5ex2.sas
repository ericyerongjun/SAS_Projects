data visit;
    length Last_Name $20 First_Name $20 Gender $1 Resid_District $20
           Home_country $20 Project_Field $20 Visit_country $20 Telephone $20;
    infile "D:\SAS_Datasets\AMAYr3visit.csv" dlm=',' dsd firstobs=2;
    input Uni_no First_Name $ Last_Name $ Gender $ Telephone $
          Resid_District $ Home_country $ Project_Field $ Visit_country $;
run;

data singapore australia(drop=Home_country) others;
    set visit(drop=Gender Telephone);
    if upcase(Visit_country) = "SINGAPORE" then output singapore;
    else if upcase(Visit_country) = "AUSTRALIA" then output australia;
    else output others;
run;
proc print data = singapore;
run;
proc print data = australia;
run;
proc print data = others;
run;
