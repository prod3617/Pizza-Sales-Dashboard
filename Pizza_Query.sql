Select * From pizza_sales

/*Total Sales*/;
SELECT ROUND(SUM(totalPrice),2) as Total_Sales FROM pizza_sales;

-- Average order value;
SELECT ROUND((SUM(totalPrice)/COUNT(DISTINCT orderID)),2) AS Avg_order FROM pizza_sales;

-- Total Pizza Sold;
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- Total Orders;
SELECT COUNT(DISTINCT orderId) AS Total_Orders FROM pizza_sales;

-- Average Pizza per order;
SELECT SUM(quantity)/COUNT(DISTINCT orderId) AS Avg_pizza_per_order FROM pizza_sales;

-- Daily Trend of Ordders;
SELECT DAYNAME(orderDate) AS Order_day, COUNT(DISTINCT orderID) AS Total_order FROM pizza_sales
GROUP BY DAYNAME(orderDate)
ORDER BY Total_order;

-- Conversion of orderDate datatype;
UPDATE pizza_sales
SET orderDate = STR_TO_DATE(orderDate, '%Y-%m-%d %H:%i:%s');
ALTER TABLE pizza_sales
MODIFY COLUMN orderDate Datetime;

SELECT orderDate, DAYNAME(orderDate) as day_name FROM pizza_sales;

-- MONTH WISE ORDER TREND;
SELECT MONTHNAME(orderDate) AS Order_Month, COUNT(DISTINCT orderId) AS Total_Orders FROM pizza_sales
GROUP BY MONTHNAME(orderDate);

SELECT YEAR(orderDate) as Order_Year, CONCAT("Q",QUARTER(orderDate)) as Quarter_period, COUNT(DISTINCT orderId) AS Total_Orders FROM pizza_sales
GROUP BY YEAR(orderDate),CONCAT("Q",QUARTER(orderDate));

SELECT orderDate, YEAR(orderDate) FROM pizza_sales;

-- % sales by pizza category;
SELECT pizzaCategory, ROUND(SUM(totalPrice) * 100 /(SELECT SUM(totalPrice) FROM pizza_sales),2) AS PTS FROM pizza_sales
GROUP BY pizzaCategory;

-- % sales by pizza sizes;
SELECT pizzaSize, ROUND(SUM(totalPrice) * 100 / (SELECT SUM(totalPrice) FROM pizza_sales),2) AS PTS_by_Size FROM pizza_sales
GROUP BY pizzaSize
ORDER BY PTS_by_Size DESC;

-- Total Pizza sold by pizza category;
SELECT pizzaCategory, SUM(quantity) as Total_pizza_sold FROM pizza_sales
GROUP BY pizzaCategory;

SELECT * FROM pizza_sales;

-- Top 5 Pizza by Revenue;
SELECT pizzaName, SUM(totalPrice) AS Total_Sales FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Sales DESC
LIMIT 5;

-- Bottom 5 Pizza by Revenue;
SELECT pizzaName, SUM(totalPrice) AS Total_Sales FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Sales
LIMIT 5;

-- Top 5 Pizza by Quantity;
SELECT pizzaName, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Quantity DESC
LIMIT 5;

-- Bottom 5 Pizza by Quantity;
SELECT pizzaName, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Quantity ASC
LIMIT 5;

-- Top 5 Pizza by Total Order;
SELECT pizzaName, COUNT(DISTINCT orderId) AS Total_Orders FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Orders DESC
LIMIT 5;

-- Bottom 5 Pizza by Total Order;
SELECT pizzaName, COUNT(DISTINCT orderId) AS Total_Orders FROM pizza_sales
GROUP BY pizzaName
ORDER BY Total_Orders ASC
LIMIT 5;