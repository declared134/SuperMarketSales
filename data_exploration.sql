
select *
from supermarketsales

-- product line with the highest ratings

select `Product line`,  avg(rating) as AverageRatings
from supermarketsales
group by `Product line`
order by AverageRatings desc

-- product line with the most sales
select `Product line`,  sum(cogs) as TotalSales
from supermarketsales
group by `Product line`
order by TotalSales desc

-- which branch/city makes the most money

-- who spends more money, men or women

-- find which product has the lowest costs vs sales

-- which time have the highest sales

-- most common forms of payment

-- product line that sells the most

-- do customers or members spend more

-- which month/quarter has the most sales

-- which products have the highest ratings

-- check invoice id duplicates

-- create a CTE

