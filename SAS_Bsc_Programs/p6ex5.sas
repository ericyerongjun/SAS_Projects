libname Ggift "D:/SAS_Datasets/BonusGift.xlsx";
libname ama "D:/SAS_Datasets";

DATA Banquet_list;
    set ama.Banquet_List;
run;
/* Remember for the "sheet1$"n to read the data from excel */
DATA supplier1;
    set Ggift."Supplier$"n (rename=(SuppID=Supplier Quantity = MinQuantity));
run;

proc sort data = banquet_list;
by Supplier;
run;

proc sort data = supplier1;
by Supplier;
run;

DATA merged_data;
merge banquet_list(IN = a) supplier1(IN = b);
by Supplier;
if a = 1 and b = 1;
run;

proc print data = merged_data;
var Banquet_Host Supplier Gift MinQuantity;
run;
