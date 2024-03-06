-- Full Table
select * from sales_walmart;

-- Total Sales by Year
select
    year(date) as Year,
    count(*) as Total_Sales,
    concat('$', format(sum(total), 0)) as Total_spend, -- Calculate total spend with formatting
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend, -- Calculate average spend with formatting
    concat('$', format(sum(cogs), 0)) as Total_Cogs, -- Calculate total cost of goods sold with formatting
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs, -- Calculate average cost of goods sold with formatting
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit, -- Calculate total profit with formatting
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit -- Calculate average profit with formatting
from sales_walmart
group by Year
order by Year asc;

-- Sales Analysis by Month
select
    month(date) as Month_Index,
    monthname(date) as Month,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit
from sales_walmart
group by Month, Month_Index
order by Month_Index asc;

-- Sales Analysis by Day of the Week
select
    weekday(date) as Day_Index,
    dayname(date) as Day,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit
from sales_walmart
group by Day_Index, Day
order by Day_Index asc;

-- Sales Analysis by Time of Day
select
    case 
        when time_of_day = 'morning' then 0
        when time_of_day = 'afternoon' then 1
        when time_of_day = 'evening' then 2
    end as Period_Index, 
    time_of_day as Period_of_Day,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit
from sales_walmart
group by Period_of_Day, Period_Index
order by Period_Index asc;

-- Sales Analysis by Branch and City
select
    branch as Branch,
    city as City,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 1) as Avg_Rating
from sales_walmart
group by city, branch
order by Sales_Count desc;

-- Sales Analysis by Product Line
select
    product_line as Product,
    count(*) as Count_Product,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 1) as Avg_Rating
from sales_walmart
group by Product
order by Count_Product desc;

-- Sales Analysis by Gender
select
    gender as Gender,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 2) as Avg_Rating
from sales_walmart
group by Gender
order by Sales_Count desc;

-- Sales Analysis by Gender and Product Line (Female)
select
    gender as Gender,
    product_line as Product,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 1) as Avg_Rating
from sales_walmart
where gender = 'Female'
group by Product
order by Sales_Count desc;

-- Sales Analysis by Gender and Product Line (Male)
select
    gender as Gender,
    product_line as Product,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 1) as Avg_Rating
from sales_walmart
where gender = 'Male'
group by Product
order by Sales_Count desc;

-- Sales Analysis by Payment Method
select
    payment_method as Paymant_Method,
    count(*) as Sales_Count,
    concat('$', format(sum(total), 0)) as Total_Spend,
    concat('$', format(round(avg(total), 0), 0)) as Avg_Spend,
    concat('$', format(sum(cogs), 0)) as Total_Cogs,
    concat('$', format(round(avg(cogs), 0), 0)) as Avg_Cogs,
    concat('$', format(sum(total)-sum(cogs), 0)) as Total_Profit,
    concat('$', format(round(avg(total), 0) - round(avg(cogs), 0), 0)) Avg_Profit,
    round(avg(rating), 1) as Avg_Rating
from sales_walmart
group by Paymant_Method
order by Sales_Count desc;
