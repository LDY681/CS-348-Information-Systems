set serveroutput on size 32000

---- Question 1: CarRentalSiteDetail detail
create or replace procedure CarRentalSiteDetail (id IN CarRentalSite.CarRentalSiteId%TYPE) as

-- declaration
rental_name CarRentalSite.CarRentalSiteName%TYPE;
rental_city CarRentalSite.City%TYPE;
total_rental number;
pop_car number;
car_name Car.CarName%TYPE; 
total_day number;

BEGIN

Select CarRentalSite.CarRentalSiteName into rental_name from CarRentalSite where CarRentalSiteId = id; 
Select CarRentalSite.City into rental_city from CarRentalSite where CarRentalSiteId = id; 

Select COUNT(Rentals.CarRentalSiteId) into total_rental from CarRentalSite INNER JOIN Rentals 
ON CarRentalSite.CarRentalSiteId = Rentals.CarRentalSiteId where CarRentalSite.CarRentalSiteId = id 
Group by CarRentalSite.CarRentalSiteId;

Select CarId into pop_car from (Select CarId, sum(numofDays) as c from Rentals where Rentals.CarRentalSiteId = id Group By CarId Order By c desc) where rownum = 1;

Select Car.CarName into car_name from Car where CarId = pop_car;
Select t into total_day from (Select CarId, sum(Rentals.numofDays) as t from Rentals Group By CarId) s where s.CarId = pop_car;

dbms_output.PUT_line(CONCAT('CarRentalSite Name: ',rental_name));
dbms_output.PUT_line(CONCAT('CarRentalSite City: ',rental_city));
dbms_output.PUT_line(CONCAT('CarRentalSite Total Rentals: ',total_rental));
dbms_output.PUT_line(CONCAT('Most Popular Compact Car: ',car_name));
dbms_output.PUT_line(CONCAT('Total Days Rented: ', total_day));

END CarRentalSiteDetail;
/


show errors;
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

