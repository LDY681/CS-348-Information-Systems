use nathank;
insert into DEPARTMENTS values (11,'Computer Sciences','West Lafayette');
insert into DEPARTMENTS values (22,'Management','West Lafayette');
insert into DEPARTMENTS values (33,'Medical Education','Purdue Calumet');
insert into DEPARTMENTS values (44,'Education','Purdue North Central');
insert into DEPARTMENTS values (55,'Pharmacal Sciences','Indianapolis');
insert into DEPARTMENTS values (66,'Physics', 'West Lafayette');

insert into STUDENT values (04181,'Jack',11,'SO',17);
insert into STUDENT values (06711,'A.Smith',22,'FR',20);
insert into STUDENT values (12341,'Banks',33,'SR',18);
insert into STUDENT values (37261,'M.Lee',55,'SO',22);
insert into STUDENT values (48291,'Bale',33,'JR',22);
insert into STUDENT values (57651,'Lim',11,'SR',19);
insert into STUDENT values (00191,'Sharon',22,'FR',22);
insert into STUDENT values (73571,'Johnson',11,'JR',19);
insert into STUDENT values (80161,'Cho',55,'JR',23);
insert into STUDENT values (80162,'Angin',11,'SR',25);

insert into FACULTY values (1010,'Layton',11);
insert into FACULTY values (1020,'Jungles',22);
insert into FACULTY values (1030,'Guzaldo',55);
insert into FACULTY values (1040,'Boling',44);
insert into FACULTY values (1050,'Mason',11);
insert into FACULTY values (1060,'Zwink',22);
insert into FACULTY values (1070,'Walton',55);
insert into FACULTY values (1080,'Teach',55);
insert into FACULTY values (1090,'Jason',55);

insert into CLASS values ('ENG40000',STR_TO_DATE('08:30','%h:%i'),'U003',1040);
insert into CLASS values ('ENG32000', STR_TO_DATE('09:30','%h:%i'),'R128',1040);
insert into CLASS values ('COM10000', STR_TO_DATE('11:30','%h:%i'),'L108',1040);
insert into CLASS values ('ME30800', STR_TO_DATE('10:30','%h:%i'),'R128',1020);
insert into CLASS values ('CS448', STR_TO_DATE('09:30','%h:%i'),'R128',1010);
insert into CLASS values ('HIS21000', STR_TO_DATE('01:30','%h:%i'),'L108',1040);
insert into CLASS values ('MATH27500', STR_TO_DATE('02:30','%h:%i'),'L108',1050);
insert into CLASS values ('STAT11000', STR_TO_DATE('04:30','%h:%i'),'R128',1050);
insert into CLASS values ('PHYS10000', STR_TO_DATE('04:30','%h:%i'),'U003',1010);

insert into ENROLLED values (04181,'CS448', 'A');
insert into ENROLLED values (04181,'MATH27500', 'B');
insert into ENROLLED values (12341,'ENG40000', 'C');
insert into ENROLLED values (12341,'MATH27500', 'A');
insert into ENROLLED values (80161,'ENG40000', 'C');
insert into ENROLLED values (80161,'ENG32000', 'D');
insert into ENROLLED values (80161,'HIS21000', 'B');
insert into ENROLLED values (80161,'STAT11000', 'B');
insert into ENROLLED values (04181,'STAT11000', 'C');
insert into ENROLLED values (12341,'COM10000', 'A');
insert into ENROLLED values (06711,'ENG40000', 'A');
insert into ENROLLED values (06711,'STAT11000', 'A');
insert into ENROLLED values (12341,'HIS21000', 'C');
insert into ENROLLED values (57651,'PHYS10000', 'A');
insert into ENROLLED values (57651,'ENG32000', 'A');
insert into ENROLLED values (57651,'COM10000', 'A');

