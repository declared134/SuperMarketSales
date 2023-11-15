
use projectportfolio

select round(sum(`gross income`),2) as `Gross Revenue`
from salesdata

select round(sum(`gross income`),2) as `Gross Revenue`, `Product line`
from supermarketsales
group by `Product line`

select round(sum(`gross income`),2) as `Gross Revenue`, branch
from supermarketsales
group by branch
order by `Gross Revenue` desc

-- sales by branch
select round(sum(total),2) as `Sales Total`, branch
from supermarketsales
group by branch
order by `Sales Total` desc

-- average rating by branch
select round(avg(Rating),2) as AvgRating, branch
from supermarketsales
group by branch
order by AvgRating desc

-- quantity of products sold by branch
select sum(quantity)as `Total Sold`, branch
from supermarketsales
group by branch
order by `Total Sold` desc

select gender, count(`Customer type`) as `Count of Members`
from supermarketsales
where `Customer type` = "Member"
group by gender

select gender, count(`Customer type`) as `Count of Normals`
from supermarketsales
where `Customer type` = "Normal"
group by gender

-- average rating by gender
select gender, round(avg(rating),2) as `Average Rating
of Normal Customers`
from supermarketsales
where `Customer type` = "Normal"
group by gender

select gender, round(avg(rating),2) as `Average Rating
of Member Customers`
from supermarketsales
where `Customer type` = "Member"
group by gender

-- customers distribution by branch and average rating
select branch, count(`Customer type`),
round(avg(rating),2) as `Average Rating`
from supermarketsales
where `Customer type` = "Member"
group by branch

-- best selling product lines
select `Product line`, count(`Product line`) as ProductsCount
from supermarketsales
group by `Product line`
order by ProductsCount desc

-- revenue contribution
select `Product line`, round(sum(`gross income`),2) as `Gross revenue`
from supermarketsales
group by `Product line`
order by `Gross revenue` desc

-- distribution of payment methods and avg rating
select  Payment, count(Payment), round(avg(rating,2) Ratings
from supermarketsales
group by payment

-- num of sales by hour
select Hour, count(totalsales) as SalesCount
from salesdata
group by Hour
order by SalesCount desc

select sd.Month, count(sd.totalsales) as SalesCount, round(avg(sm.rating),2) as AverageRating
from salesdata sd
join supermarketsales sm
on sd.branch = sm.branch
group by sd.Month
order by SalesCount desc


-- gross margin percentage
select `Product line`, avg(`gross margin percentage`)
from supermarketsales
group by `Product line`

-- unit price per product line
select `Product line`, avg((cogs/quantity)) as UnitPrice, avg(quantity) as
QuantitySold, sum(`gross income`) as GrossIncome
from supermarketsales
group by `Product line`
order by UnitPrice desc

-- ratings and total sales
select `Product line`, avg(rating) as
Ratings, sum(`gross income`) as GrossIncome
from supermarketsales
group by `Product line`
order by Ratings desc

-- ratigs by gender
select `Product line`, gender, round(avg(rating),2) as AvgRatings,
count(quantity) as TotalSales
from supermarketsales
group by `Product line`, gender
order by AvgRatings desc


-- top selling product lines
select `Product line`, sum(quantity) as TotalSales
from supermarketsales
group by `Product line`
order by TotalSales desc

select branch, sum(quantity) as TotalSales
from supermarketsales
group by branch
order by TotalSales desc




