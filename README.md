# PowerBI and MySQL Data Analysis

## Pizza Sales Analysis

### Table of Contents

- [Project Description](#project-description)
- [Data Source](#data-source)
- [Data Cleaning](#data-cleaning)
- [Tools](#tools)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
  

### Project Description
The project aims to create a comprehensive dashboard to analyze pizza sales. In this project, we have created 2 dashboards to analyze the pizza sales. One dashboard gives the overall summary of the sales and the other dashboard provides the top 5 best and worst pizzas by sales, order, and quantity. We have also performed an exploratory analysis of the pizza sales data in MySQL to get information on the important key metrics.

![Pizza Sales Dashboard image](Pizza%20Sales%20Dashboard.png)

### Data Source
- Pizza Sales Data: The data is available in the "pizza_sales.csv" file which contains all the information about the pizza sales.

### Tools
- MySQL: To perform exploratory analysis and find answers for some key metrics.
- Power BI Desktop: For data cleaning and visualization.

### Data Cleaning
- In the Power BI Desktop, we have inserted the csv data. I have checked each column for missing values and formatting issues. I have also checked whether the datatypes assigned to each column are correct. I have also created some new columns as a month column, a day column, and others.

### Exploratory Data Analysis
Performed some exploratory data analysis to find some information about key questions like
- Total sales of pizza.
- Total orders of pizza.
- How many orders are received on each day of the week as well as in each month?
- Pizza sales by category, and size.
- Which are the top 5 best and worst pizza according to sales, order, and quantity?

### Data Analysis
To find the answer to the key questions, I have written some query in the MySQL as
``` MySQL
-- Daily Trend of Ordders;
SELECT DAYNAME(orderDate) AS Order_day, COUNT(DISTINCT orderID) AS Total_order FROM pizza_sales
GROUP BY DAYNAME(orderDate)
ORDER BY Total_order;
```
``` PowerBI
Total_Sales = SUM(pizza_sales[total_price])
```

### Results/Findings
- The Thai Chicken Pizza generates the most revenue and the Brie Carre Pizza generates the least revenue.
- The Classic Deluxe Pizza is the most sold-out pizza.
- Orders are higher on weekends.
- Orders are higher in July and January as compared to other months.
- Large size pizza generates the maximum revenue.
  
