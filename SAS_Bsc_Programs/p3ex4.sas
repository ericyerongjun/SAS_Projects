DATA AMA;
length Name $ 30 Phone $ 30 Fax $ 30;
infile "D:\SAS_Datasets\AMA_contacts.csv" DLM=","  MISSOVER;
input Name  $ Phone $ Fax $;
run;

Proc Print data = AMA;
run;
