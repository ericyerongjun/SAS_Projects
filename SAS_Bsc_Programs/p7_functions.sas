DATA abc;
/* Return a SAS date value from numeric month, day and year values. */
Join_Date = MDY(7, 31, 1997);
run;
proc print DATA=abc;
format Join_Date DDMMYY.;
run;
DATA Statistics;
Var1 = .;
Var2 = 11;
Var3 = 5;
Var4 = 8;
/* Return the sum of the numeric arguments */
SumVar = SUM(Var1, Var2, Var3, Var4);
/* Return the average of the numeric arguments */
MeanVar=MEAN(oF Var1-Var4);
/* Return the smallest value of the numeric arguments */
MinVar=MIN(Var1,Var2,Var3,Var4);
/* Return the largest value of the numeric arguments */
MaxVar=MAX(Var1,Var2,Var3, Var4);
/* Count of the non-missing arguments */
NVar=N(oF Var1-Var4);
/* Count the missing numeric arguments */
NMissVar=NMISS(Var1,Var2,Var3,Var4);
/* Count of the missing numeric arguments */
CMissVar=CMISS(Var1,Var2,Var3,Var4);
run; 
proc print DATA=Statistics;
var SumVar MeanVar MinVar MaxVar NVar NMissVar CMissVar;
run;
DATA Truncation;
Value1 = 7.478;
/* Return a value rounded to the nearest multiple of the round-off-unit for the argument */
RDValue1 = ROUND(Value1,0.25);
/* Return the smallest integer greater than or equal to the argument */
CeilValue1 = CEIL(Value1);
/* Return the greatest integer less than or equal to the argument */
FloorValue1 = FLOOR(Value1);
/* Return the integer part of argument */
IntValue1 = INT(Value1);
run;
proc print DATA=Truncation;
Var RDValue1 CeilValue1 FloorValue1 IntValue1;
run;
DATA Char_Data;
length phrase1 $40;
phrase1=" sas programming      course ";
/* Return the character in upper case of the argument */
upcase_ph = upcase(phrase1);
/* Convert all words in an argument to proper case. i.e. First letter is uppercase and the remaining letters are lowercase, delimiter can be added */
Propcase_ph = propcase(phrase1);
/* Return the character in lower case of the argument */
lowcase_up_ph = lowcase(upcase(phrase1));
/* Right align a character expression */
Right_ph = right(phrase1);
/* Left align a character expression */
Left_ph = left(phrase1);
/* Remove trailing blanks from string */
trim_ph = trim(phrase1);
/* Remove multiple blanks from string by translating each occurrence of two or more consecutive blanks into a single blank */
Compbl_ph = compbl(phrase1);
/* Remove the characters listed in chars argument from the source character string */
compress_ph = compress(phrase1, "a");
/* Remove all leading and trailing blanks from string */
strip_ph = strip(phrase1);
run;
proc print DATA = Char_Data;
Var upcase_ph propcase_ph lowcase_up_ph right_ph left_ph trim_ph compbl_ph compress_ph strip_ph;
run; 
DATA Scan_Year;
Text = "Saint Dorothy's Day, February 6th, 2007";
Year = scan(Text, -1);
run;
proc print data = scan_year;
run;
data catfunctions; /* p4ex11.sas */
FamilyName=" Luenberger ";
FirstName=" David ";
/* Concatenate the n strings and insert the seperator between strings. Note that leading and trailing blanks are removed from each argument. Length of the created variable is 200 bytes, unless it is defined in the length statement */
Catx_FName=Catx(" ", FirstName, FamilyName);
/* Concatenate the n strings. No action is made on n strings before concatenation */
Cat_FName=Cat(FirstName, FamilyName);
/* Concatenate the n strings. The leading and trailing blanks are removed before concatenation */
Cats_FName=Cats(FirstName, FamilyName);
/* Concatenate the n strings. The trailing blanks are removed before concatenation */
Catt_FName=Catt(FirstName, FamilyName);
run; 
proc print DATA = catfunctions;
run;
