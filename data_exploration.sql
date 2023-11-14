
select *
from supermarketsales

-- product line with the highest ratings

select `Product line`,  round(avg(rating),2) as AverageRatings
from supermarketsales
group by `Product line`
order by AverageRatings desc

-- product line with the most sales
select `Product line`,  branch, sum(cogs) as TotalSales
from supermarketsales
group by `Product line`, branch
order by TotalSales desc

-- product line witht he highest gross income
select `Product line`,  branch, round(sum(`gross income`),2) as GrossIncome
from supermarketsales
group by `Product line`, branch
order by GrossIncome desc


-- which branch/city makes the most money
select branch, city, sum(cogs) as TotalSales
from supermarketsales
group by branch, city
order by TotalSales desc

-- who spends more money, men or women
select gender, sum(total) as TotalSales
from supermarketsales
group by gender
order by TotalSales desc

-- most popular product lines by gender
select `Product line`, gender, count(`Product line`) as ProductLine
from supermarketsales
group by `Product line`,gender
order by ProductLine desc

-- most popular product lines by branch
select `Product line`, branch, count(`Product line`) as ProductLine
from supermarketsales
group by `Product line`,branch
order by ProductLine desc

-- find which product has the lowest costs vs sales,
-- average costs vs gross income
-- product line that sells the most
select `Product line`, avg((cogs - `gross income` )) as costs,
sum(Quantity) as TotalSales
from supermarketsales
group by `Product line`
order by costs, TotalSales asc

-- which hour have the highest sales
select substring(Time, 1,2) as Hour, sum(quantity) as TotalSales
from supermarketsales
group by Hour
order by TotalSales desc

-- most common forms of payment
select Payment, count(Payment) as Count
from supermarketsales
group by Payment
order by Count desc

-- do customers or members spend more money
select `Customer type`, avg(Total) as AverageMoneySpent
from supermarketsales
group by `Customer type`

-- which month has the most sales
SELECT MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month, sum(quantity) as TotalSales
FROM supermarketsales
group by Month
order by TotalSales desc

-- check invoice id duplicates

SELECT `Invoice ID`, COUNT(*) AS count
FROM supermarketsales
GROUP BY `Invoice ID`
HAVING count > 1

-- create a CTE

with SalesCTE as (
	
    SELECT MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month, substring(Time, 1,2) as Hour, 
    sum(quantity) as TotalSales, branch, round(avg(rating),2) as AverageRatings
	FROM supermarketsales
	group by Month, Hour, branch
	order by TotalSales desc

)

select sum(totalsales) as TotalSales, branch
from SalesCTE
group by branch
