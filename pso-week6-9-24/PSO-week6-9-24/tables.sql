create table DEPARTMENT(deptid integer, dname varchar(30), location varchar(30), primary key(deptid));

create table FACULTY(fid integer, fname varchar(30), deptid integer, primary key(fid), foreign key(deptid) references DEPARTMENT(deptid));

create table STUDENT(snum integer, sname varchar(30), deptid integer, slevel varchar(10), birthdate date, primary key(snum), foreign key (deptid) references DEPARTMENT(deptid));

create table CLASS(cname varchar(30), meets_at time, room varchar(10), fid integer, primary key(cname));

create table ENROLLED(snum integer, cname varchar(30), grade varchar(2), primary key(snum, cname), foreign key(snum) references STUDENT(snum), foreign key(cname) references CLASS(cname));

