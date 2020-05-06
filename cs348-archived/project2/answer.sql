set serveroutput on size 32000

-- Question 1: CarRentalSiteDetail detail
create or replace procedure CarRentalSiteDetail (id IN CarRentalSite.CarRentalSiteId%TYPE) as
BEGIN

END CarRentalSiteDetail;
/

BEGIN
CarRentalSiteDetail(1);
end;
/


-- Question 2:

create or replace procedure MonthlyBusinessRentalsReport as

BEGIN

END MonthlyBusinessRentalsReport;
/
BEGIN
        MonthlyBusinessRentalsReport;
End;
/


-- Question 3:

create or replace procedure MostandLeastProfitCarIndiana as

BEGIN

END MostandLeastProfitCarIndiana;
/

BEGIN
        MostandLeastProfitCarIndiana;
END;
/


-- Question 4:

create table BusinessRentalCategoryTable(CarRentalSiteId integer, Compact integer, Luxury integer, SUV integer, primary key(CarRentalSiteId));
create or replace procedure BusinessRentalCategory as

BEGIN

END BusinessRentalCategory;
/

BEGIN
BusinessRentalCategory;
END;
/
select * from BusinessRentalCategoryTable;

drop table BusinessRentalCategoryTable;


-- Question 5:

create or replace procedure CarCategoryInventoryInfo(crsid IN CarRentalSite.CarRentalSiteId%TYPE) as

BEGIN

END CarCategoryInventoryInfo;
/

BEGIN
CarCategoryInventoryInfo(1);
END;
/

BEGIN
CarCategoryInventoryInfo(111);
END;
/

