use blinkitdb;

select * from blinkit_data;


-- check count of db
select COUNT(*) from blinkit_data;

-- data cleaning or removing irregulatories 

update blinkit_data
SET Item_Fat_Content = 
CASE
WHEN Item_Fat_Content IN ('LF','low fat') Then 'Low Fat'
When Item_Fat_Content = 'reg' Then 'Regular'
else Item_Fat_Content 
End;

--After executing the above query check the data has been cleaned or not by using below query
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;

--total sales
select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions from  blinkit_data;

--types of total sales can be found by filtering it
select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions from  blinkit_data
where Item_Fat_Content = 'Low Fat';

select cast(sum(Total_Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions from  blinkit_data
where Outlet_Establishment_Year = 2022;

--AVERAGE SALES
select cast(avg(Total_Sales) as int) as AVG_Sales from blinkit_data;

--NO OF ITEMS
select COUNT(*) as No_of_Orders from blinkit_data;

--AVG RATING
select cast(AVG(Rating) as decimal(10,2)) as Avg_Rating from blinkit_data; 

--Total Sales by Fat Content:
select Item_Fat_Content , cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales from  blinkit_data
group by Item_Fat_Content
order by Total_Sales desc;

-- some more metrics such as finding average,etc in above syntax
select Item_Fat_Content , 
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales, 
	cast(AVG(Total_Sales) as decimal(10,2)) as Avg_Sales,
	COUNT(*) as No_of_Orders,
	cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from  blinkit_data
--where Outlet_Establishment_Year = 2022
group by Item_Fat_Content
order by Total_Sales desc;


--Total Sales by Item Type
select Item_Type , 
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales, 
	cast(AVG(Total_Sales) as decimal(10,2)) as Avg_Sales,
	COUNT(*) as No_of_Orders,
	cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from  blinkit_data
--where Outlet_Establishment_Year = 2022
group by Item_Type
order by Total_Sales desc;

-- to find top 5 item we can use use top
select Top 5 Item_Type , 
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales, 
	cast(AVG(Total_Sales) as decimal(10,2)) as Avg_Sales,
	COUNT(*) as No_of_Orders,
	cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from  blinkit_data
--where Outlet_Establishment_Year = 2022
group by Item_Type
order by Total_Sales desc;

--Fat Content by Outlet location for Total Sales

select Outlet_Location_Type, Item_Fat_Content , 
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales
	
from  blinkit_data

group by Outlet_Location_Type,Item_Fat_Content
order by Total_Sales desc;

---or----
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

--Total Sales by Outlet Establishment
select Outlet_Establishment_Year,
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales, 
	cast(AVG(Total_Sales) as decimal(10,2)) as Avg_Sales,
	COUNT(*) as No_of_Orders,
	cast(AVG(Rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year ASC;

--Percentage of Sales by Outlet Size

select Outlet_Size,
	cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales, 
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
from blinkit_data
group by Outlet_Size
order by Total_Sales DESC;

--Sales by Outlet Location
SELECT Outlet_Location_Type, 
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
	cast(AVG(Total_Sales) as decimal(10,2)) as Avg_Sales,
	COUNT(*) as No_of_Orders,
	cast(AVG(Rating) as decimal(10,2)) as Avg_Rating,
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

--All Metrics by Outlet Type
SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;


