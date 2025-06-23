libname Ggift "D:/SAS_Datasets/BonusGift.xlsx";
libname ama "D:/SAS_Datasets";

DATA Banquet_list;
    set ama.Banquet_List;
run;
/* Remember for the "sheet1$"n to read the data from excel */
DATA supplier1;
    set Ggift."Supplier$"n (rename=(SuppID=Supplier Quantity=MinQuantity));
run;

proc print data=Banquet_list;
run;

proc print data=supplier1;
run;
