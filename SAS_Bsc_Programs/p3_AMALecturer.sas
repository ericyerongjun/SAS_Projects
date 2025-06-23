DATA AMALecturer (drop=type course lecturer);
infile "D:\SAS_Datasets\course_lecturer_info.txt";
retain Course Lecturer;
input type $1. @;
if type = 'c' then
input @3 course $ lecturer $;
else if type = 'L' then
do;
input @3 LectName $9.  Phone_Ext $ ;
output AMALecturer;
end;
run;

Proc print data = AMALecturer;
run;
