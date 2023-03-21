SELECT * FROM project.dbo.Hotel1;
SELECT * FROM project.dbo.Hotel2; 

--Exploratory Data Analysis

--No of hotels in dataset
Select count(DISTINCT Hotel_id)
From project.dbo.Hotel2;

-- No of hotels citywise
Select city , count(distinct Hotel_id)
From project.dbo.Hotel2
Group By city;

--Cancellation rate citywise
Select h2.city , count(status) as cancelled_citywise
from project.dbo.Hotel1 as h1 LEFT JOIN project.dbo.Hotel2 as h2 on h1.hotel_id = h2.Hotel_id
where h1.status = 'Cancelled'
group by city
order by city

--no of bookings in each city in the month of january , febuary, and march
Select h2.City , count(h1.date_of_booking) as no_of_bookings
From project.dbo.Hotel1 as h1 LEFT JOIN project.dbo.Hotel2 as h2 on h1.hotel_id = h2.Hotel_id
Where h1.Bookingmonth IN (1,2,3)
Group By City


--No of nights stayed by the customers
--using age function
select AGE(CHECK_OUT,CHECK_IN) AS NO_OF_NIGHTS , count(customer_id) as no_of_customers_stayed  
from project.dbo.Hotel1
group by NO_OF_NIGHTS
ORDER BY no_of_customers_stayed DESC

--Customers booking rooms on same day
Select date_of_booking , count(customer_id) as no_of_customers
from project.dbo.Hotel1
Where status = 'Stayed'
Group by date_of_booking
order by date_of_booking

--No of pre-bookings made
Select  count(*) as number_of_pre_bookings
From project.dbo.Hotel1
where check_in> date_of_booking

--Different types of pre-bookings made on basis of day
SELECT COUNT(*) AS NO_OF_CUSTOMER,
	AGE(check_in,date_of_booking) AS DIFFERENCE_IN_DAYS
FROM project.dbo.Hotel1
WHERE AGE(check_in,date_of_booking) <> '00:00:00'
GROUP BY DIFFERENCE_IN_DAYS
ORDER BY NO_OF_CUSTOMER DESC













