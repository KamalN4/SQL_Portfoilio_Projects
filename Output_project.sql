SELECT * FROM Oyo_project.dbo.Booking_details;
SELECT * FROM Oyo_project.dbo.Hotel_details; 

--Exploratory Data Analysis

--No of hotels in dataset
Select count(DISTINCT Hotel_id)
From Oyo_project.dbo.Hotel_details;

-- No of hotels citywise
Select city , count(distinct Hotel_id) no_of_hotels
From Oyo_project.dbo.Hotel_details
Group By city;

--Avg No of hotels 
Select count(distinct Hotel_id)/count(distinct city)
From Oyo_project.dbo.Hotel_details
  
--no of bookings in each city 
Select h2.City , count(h1.date_of_booking) as no_of_bookings
From Oyo_project.dbo.Booking_details as h1 LEFT JOIN Oyo_project.dbo.Hotel_details as h2 on h1.hotel_id = h2.Hotel_id
Group By City

  
--Cancellation rate citywise
Select h2.city , count(status) as cancelled_citywise
from Oyo_project.dbo.Booking_details as h1 LEFT JOIN Oyo_project.dbo.Hotel_details as h2 on h1.hotel_id = h2.Hotel_id
where h1.status = 'Cancelled'
group by city
order by city

  
  -- Average price of hotels across cities 
Select h2.City , avg(h1.amount) as avg_amt
From Oyo_project.dbo.Booking_details as h1 LEFT JOIN Oyo_project.dbo.Hotel_details as h2 on h1.hotel_id = h2.Hotel_id
Group By City



--No of nights stayed by the customers
--using DATEDIFF function
select DATEDIFF( DAY,check_in , check_out) no_of_nights_stayed , count(customer_id) no_of_customers
from Oyo_project.dbo.Booking_details
Group by no_of_nights_stayed



--Customers booking rooms on same day
Select date_of_booking , count(customer_id) as no_of_customers
from Oyo_project.dbo.Booking_details
Where status = 'Stayed'
Group by date_of_booking
order by date_of_booking

--No of pre-bookings made
Select  count(*) as number_of_pre_bookings
From Oyo_project.dbo.Booking_details
where check_in> date_of_booking

--Different types of pre-bookings made on basis of day
SELECT DATEDIFF(DAY , date_of_booking , check_in) AS DIFFERENCE_IN_DAYS , COUNT(*) AS NO_OF_CUSTOMER
FROM Oyo_project.dbo.Booking_details
WHERE DIFFERENCE_IN_DAYS <>0
GROUP BY DIFFERENCE_IN_DAYS

--Finding 10th highest amount
Select amount FROM Oyo_project.dbo.Booking_details o1 
where 9 = (Select count(distinct(o2.amount))
          from Oyo_project.dbo.Booking_details o2
          where o2.amount > o1.amount)

















