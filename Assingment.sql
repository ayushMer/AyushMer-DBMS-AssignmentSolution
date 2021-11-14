--Q1
create table PASSENGER
(
Passenger_name varchar(50),
Category varchar(7),
Gender varchar(1),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50)
);

create table PRICE
(
Bus_Type varchar(50),
Distance int,
Price int,
PRIMARY Key(Bus_Type,Distance,Price)
);

--Q2
insert into PASSENGER values
('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
('Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper'),
('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper'),
('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper'),
('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
('Piyush','AC','M','Pune','Nagpur',700,'Sitting');


insert into PRICE values
('Sleeper',350,770),
('Sleeper',500,1100),
('Sleeper',600,1320),
('Sleeper',700,1540),
('Sleeper',1000,2200),
('Sleeper',1200,2640),
('Sleeper',350,434),
('Sitting',500,620),
('Sitting',600,744),
('Sitting',700,868),
('Sitting',1000,1240),
('Sitting',1200,1488),
('Sitting',1500,1860);

--Q3
select Gender,count(Gender) as counts
From PASSENGER  where distance >=600 group by Gender;

--Q4
Select min(Price)as Min_Sleeper_price From PRICE where Bus_type='Sleeper';

--Q5
Select Passenger_name from PASSENGER
Where passenger_name like 'S%';

--Q6
Select 
a.passenger_name,a.boarding_city,
a. destination_city,a.bus_type,
b.price from PASSENGER a inner join PRICE b
On a.distance =b.distance;


--Q7
Select 
a.passenger_name,
b.price from PASSENGER a inner join PRICE b
On a.distance=b.distance 
Where a.distance=1000 and a.bus_type='Sitting';

--Q8
Select Bus_type ,price from PRICE where distance in (
 Select distance from PASSENGER where 
(
(Boarding_city='Bengaluru' And Destination_city='panaji') or
(Boarding_city='panaji' And Destination_city='Bengaluru')
));

--Q9
Select distinct(distance) from PASSENGER 
order by distance desc;

--Q10
Select Passenger_name,
round((distance*100.0/(Select sum(distance) from PASSENGER)),2)
As Percentage_distance_travelled
From PASSENGER;

--Q11
Create PROCEDURE ‘CategorySelection’ ()

Begin

Select distance , price , 

case 

When price > 1000 Then ‘Expensive’

When price > 500 and price <1000 Then ‘Average Cost’

Else ‘Cheap’

end as Category From PRICE;

End

--call procedure using 
--exec CategorySelection
