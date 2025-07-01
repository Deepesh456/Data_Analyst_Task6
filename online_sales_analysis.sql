# mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create database online_sales;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> use online_sales;
Database changed
MariaDB [online_sales]> create table orders (
    -> Order_ID varchar(20),
    -> Amount int,
    -> Profit int,
    -> Quantity int,
    -> Category Varchar(30),
    -> Sub_Category Varchar(30),
    -> Order_Date Date,
    -> Payment_Mode Varchar(15),
    -> State Varchar(20),
    -> City Varchar(20)
    -> );
Query OK, 0 rows affected (0.018 sec)

MariaDB [online_sales]> load data infile "C:/Users/DEEPESH KUMAR K/Downloads/Online_Sales.csv"
    -> into table orders
    -> fields terminated by ','
    -> lines terminated by '\n'
    -> ignore 1 rows;
Query OK, 1500 rows affected, 1500 warnings (0.033 sec)
Records: 1500  Deleted: 0  Skipped: 0  Warnings: 1500

MariaDB [online_sales]> select * from orders limit 10;
+----------+--------+--------+----------+-------------+------------------+------------+--------------+-----------+-------------------+
| Order_ID | Amount | Profit | Quantity | Category    | Sub_Category     | Order_Date | Payment_Mode | State     | City|
+----------+--------+--------+----------+-------------+------------------+------------+--------------+-----------+-------------------+
| B-25681  |   1096 |    658 |        7 | Electronics | Electronic Games | 2018-06-04 | COD          | Bhawna    | Madhya Pradesh|
| B-26055  |   5729 |     64 |       14 | Furniture   | Chairs           | 2018-03-10 | EMI          | Harivansh | Uttar Pradesh|
| B-25955  |   2927 |    146 |        8 | Furniture   | Bookcases        | 2018-01-16 | EMI          | Shiva     | Maharashtra|
| B-26093  |   2847 |    712 |        8 | Electronics | Printers         | 2018-03-27 | Credit Card  | Sarita    | Maharashtra|
| B-25602  |   2617 |   1151 |        4 | Electronics | Phones           | 2018-04-01 | Credit Card  | Vrinda    | Maharashtra|
| B-25881  |   2244 |    247 |        4 | Clothing    | Trousers         | 2018-11-25 | Credit Card  | Lalita    | Uttar Pradesh|
| B-25696  |    275 |   -275 |        4 | Clothing    | Saree            | 2018-06-21 | COD          | Noopur    | Karnataka|
| B-25687  |    387 |   -213 |        5 | Clothing    | Saree            | 2018-06-11 | UPI          | Sanjna    | Maharashtra|
| B-25643  |     50 |    -44 |        2 | Clothing    | Hankerchief      | 2018-04-29 | UPI          | Kirti     | Jammu and Kashmir|
| B-25851  |    135 |    -54 |        5 | Clothing    | Kurti            | 2018-11-06 | COD          | Kushal    | Nagaland|
+----------+--------+--------+----------+-------------+------------------+------------+--------------+-----------+-------------------+
10 rows in set (0.001 sec)

MariaDB [online_sales]> SELECT SUM(Amount) AS Total_Sales
    -> FROM orders;
+-------------+
| Total_Sales |
+-------------+
|      437771 |
+-------------+
1 row in set (0.001 sec)

MariaDB [online_sales]> SELECT AVG(Profit) AS Average_Profit
    -> FROM orders;
+----------------+
| Average_Profit |
+----------------+
|        24.6420 |
+----------------+
1 row in set (0.001 sec)

MariaDB [online_sales]> SELECT Category, SUM(Quantity) AS Total_Quantity
    -> FROM orders
    -> GROUP BY Category;
+-------------+----------------+
| Category    | Total_Quantity |
+-------------+----------------+
| Clothing    |           3516 |
| Electronics |           1154 |
| Furniture   |            945 |
+-------------+----------------+
3 rows in set (0.003 sec)

MariaDB [online_sales]> SELECT State, SUM(Amount) AS Total_Sales
    -> FROM orders
    -> GROUP BY State
    -> ORDER BY Total_Sales DESC
    -> LIMIT 5;
+-------------+-------------+
| State       | Total_Sales |
+-------------+-------------+
| Harivansh   |        9902 |
| Madhav      |        9365 |
| Madan Mohan |        7766 |
| Shiva       |        6339 |
| Vishakha    |        6120 |
+-------------+-------------+
5 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    -> YEAR(Order_Date) AS Year,
    -> MONTH(Order_Date) AS Month,
    -> SUM(Amount) AS Total_Sales
    -> FROM orders
    -> GROUP BY Year, Month
    -> ORDER BY Year, Month;
+------+-------+-------------+
| Year | Month | Total_Sales |
+------+-------+-------------+
| 2018 |     1 |       61632 |
| 2018 |     2 |       38962 |
| 2018 |     3 |       60694 |
| 2018 |     4 |       34330 |
| 2018 |     5 |       29093 |
| 2018 |     6 |       23658 |
| 2018 |     7 |       12966 |
| 2018 |     8 |       31492 |
| 2018 |     9 |       27283 |
| 2018 |    10 |       31613 |
| 2018 |    11 |       48469 |
| 2018 |    12 |       37579 |
+------+-------+-------------+
12 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT Sub_Category, SUM(Profit) AS Total_Profit
    -> FROM orders
    -> GROUP BY Sub_Category
    -> ORDER BY Total_Profit DESC
    -> LIMIT 1;
+--------------+--------------+
| Sub_Category | Total_Profit |
+--------------+--------------+
| Printers     |         8606 |
+--------------+--------------+
1 row in set (0.003 sec)

MariaDB [online_sales]> SELECT Payment_Mode, COUNT(*) AS Number_of_Orders
    -> FROM orders
    -> GROUP BY Payment_Mode;
+--------------+------------------+
| Payment_Mode | Number_of_Orders |
+--------------+------------------+
| COD          |              684 |
| Credit Card  |              163 |
| Debit Card   |              202 |
| EMI          |              120 |
| UPI          |              331 |
+--------------+------------------+
5 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   EXTRACT(YEAR FROM Order_Date) AS Year,
    ->   EXTRACT(MONTH FROM Order_Date) AS Month,
    ->   SUM(Amount) AS Monthly_Revenue
    -> FROM orders
    -> GROUP BY Year, Month
    -> ORDER BY Year, Month;
+------+-------+-----------------+
| Year | Month | Monthly_Revenue |
+------+-------+-----------------+
| 2018 |     1 |           61632 |
| 2018 |     2 |           38962 |
| 2018 |     3 |           60694 |
| 2018 |     4 |           34330 |
| 2018 |     5 |           29093 |
| 2018 |     6 |           23658 |
| 2018 |     7 |           12966 |
| 2018 |     8 |           31492 |
| 2018 |     9 |           27283 |
| 2018 |    10 |           31613 |
| 2018 |    11 |           48469 |
| 2018 |    12 |           37579 |
+------+-------+-----------------+
12 rows in set (0.001 sec)

MariaDB [online_sales]> SELECT
    ->   EXTRACT(YEAR FROM Order_Date) AS Year,
    ->   EXTRACT(MONTH FROM Order_Date) AS Month,
    ->   SUM(Amount) AS Revenue,
    ->   COUNT(DISTINCT Order_ID) AS Order_Volume
    -> FROM orders
    -> WHERE Order_Date BETWEEN '2024-01-01' AND '2024-12-31'
    -> GROUP BY Year, Month
    -> ORDER BY Year, Month;
Empty set (0.001 sec)

MariaDB [online_sales]> SELECT
    ->   EXTRACT(YEAR FROM Order_Date) AS Year,
    ->   EXTRACT(MONTH FROM Order_Date) AS Month,
    ->   SUM(Amount) AS Revenue
    -> FROM orders
    -> GROUP BY Year, Month
    -> ORDER BY Revenue DESC
    -> LIMIT 5;
+------+-------+---------+
| Year | Month | Revenue |
+------+-------+---------+
| 2018 |     1 |   61632 |
| 2018 |     3 |   60694 |
| 2018 |    11 |   48469 |
| 2018 |     2 |   38962 |
| 2018 |    12 |   37579 |
+------+-------+---------+
5 rows in set (0.001 sec)

MariaDB [online_sales]> SELECT
    ->   Category,
    ->   SUM(Amount) AS Total_Revenue
    -> FROM orders
    -> GROUP BY Category
    -> ORDER BY Total_Revenue DESC;
+-------------+---------------+
| Category    | Total_Revenue |
+-------------+---------------+
| Electronics |        166267 |
| Clothing    |        144323 |
| Furniture   |        127181 |
+-------------+---------------+
3 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   Sub_Category,
    ->   AVG(Profit) AS Average_Profit
    -> FROM orders
    -> GROUP BY Sub_Category
    -> ORDER BY Average_Profit DESC
    -> LIMIT 5;
+--------------+----------------+
| Sub_Category | Average_Profit |
+--------------+----------------+
| Tables       |       184.6471 |
| Printers     |       116.2973 |
| Bookcases    |        82.4810 |
| Trousers     |        73.0000 |
| Accessories  |        46.5694 |
+--------------+----------------+
5 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   Sub_Category,
    ->   AVG(Profit) AS Average_Profit
    -> FROM orders
    -> GROUP BY Sub_Category
    -> ORDER BY Average_Profit DESC
    -> LIMIT 5;
+--------------+----------------+
| Sub_Category | Average_Profit |
+--------------+----------------+
| Tables       |       184.6471 |
| Printers     |       116.2973 |
| Bookcases    |        82.4810 |
| Trousers     |        73.0000 |
| Accessories  |        46.5694 |
+--------------+----------------+
5 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   Payment_Mode,
    ->   COUNT(*) AS Number_of_Orders
    -> FROM orders
    -> GROUP BY Payment_Mode
    -> ORDER BY Number_of_Orders DESC;
+--------------+------------------+
| Payment_Mode | Number_of_Orders |
+--------------+------------------+
| COD          |              684 |
| UPI          |              331 |
| Debit Card   |              202 |
| Credit Card  |              163 |
| EMI          |              120 |
+--------------+------------------+
5 rows in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   EXTRACT(YEAR FROM Order_Date) AS Year,
    ->   EXTRACT(MONTH FROM Order_Date) AS Month,
    ->   COUNT(DISTINCT Order_ID) AS Unique_Orders
    -> FROM orders
    -> GROUP BY Year, Month
    -> ORDER BY Year, Month;
+------+-------+---------------+
| Year | Month | Unique_Orders |
+------+-------+---------------+
| 2018 |     1 |            61 |
| 2018 |     2 |            54 |
| 2018 |     3 |            58 |
| 2018 |     4 |            44 |
| 2018 |     5 |            31 |
| 2018 |     6 |            30 |
| 2018 |     7 |            31 |
| 2018 |     8 |            31 |
| 2018 |     9 |            30 |
| 2018 |    10 |            43 |
| 2018 |    11 |            46 |
| 2018 |    12 |            41 |
+------+-------+---------------+
12 rows in set (0.003 sec)

MariaDB [online_sales]> SELECT
    ->   Order_Date,
    ->   SUM(Amount) AS Revenue
    -> FROM orders
    -> GROUP BY Order_Date
    -> ORDER BY Revenue DESC
    -> LIMIT 1;
+------------+---------+
| Order_Date | Revenue |
+------------+---------+
| 2018-03-10 |   14898 |
+------------+---------+
1 row in set (0.002 sec)

MariaDB [online_sales]> SELECT
    ->   Category,
    ->   SUM(Amount) AS Revenue,
    ->   SUM(Amount) / (SELECT SUM(Amount) FROM orders) * 100 AS Revenue_Share_Percent
    -> FROM orders
    -> GROUP BY Category
    -> ORDER BY Revenue_Share_Percent DESC;
+-------------+---------+-----------------------+
| Category    | Revenue | Revenue_Share_Percent |
+-------------+---------+-----------------------+
| Electronics |  166267 |               37.9804 |
| Clothing    |  144323 |               32.9677 |
| Furniture   |  127181 |               29.0519 |
+-------------+---------+-----------------------+
3 rows in set (0.003 sec)

MariaDB [online_sales]> SELECT
    ->   EXTRACT(YEAR FROM Order_Date) AS Year,
    ->   EXTRACT(MONTH FROM Order_Date) AS Month,
    ->   COUNT(DISTINCT Order_ID) AS Unique_Orders
    -> FROM orders
    -> GROUP BY Year, Month
    -> ORDER BY Year, Month
    -> LIMIT 10;
+------+-------+---------------+
| Year | Month | Unique_Orders |
+------+-------+---------------+
| 2018 |     1 |            61 |
| 2018 |     2 |            54 |
| 2018 |     3 |            58 |
| 2018 |     4 |            44 |
| 2018 |     5 |            31 |
| 2018 |     6 |            30 |
| 2018 |     7 |            31 |
| 2018 |     8 |            31 |
| 2018 |     9 |            30 |
| 2018 |    10 |            43 |
+------+-------+---------------+
10 rows in set (0.013 sec)

MariaDB [online_sales]> SELECT
    ->   Order_Date,
    ->   SUM(Amount) AS Daily_Revenue
    -> FROM orders
    -> GROUP BY Order_Date
    -> ORDER BY Order_Date
    -> Limit 10;
+------------+---------------+
| Order_Date | Daily_Revenue |
+------------+---------------+
| 2018-01-01 |           147 |
| 2018-01-02 |          1678 |
| 2018-01-03 |          1397 |
| 2018-01-04 |          2918 |
| 2018-01-05 |          1948 |
| 2018-01-06 |           114 |
| 2018-01-07 |           177 |
| 2018-01-08 |           646 |
| 2018-01-09 |          1907 |
| 2018-01-10 |           169 |
+------------+---------------+
10 rows in set (0.003 sec)

MariaDB [online_sales]> SELECT
    ->   State,
    ->   SUM(Profit) / SUM(Amount) * 100 AS Profit_Margin_Percent
    -> FROM orders
    -> GROUP BY State
    -> ORDER BY Profit_Margin_Percent DESC
    -> LIMIT 10;
+------------+-----------------------+
| State      | Profit_Margin_Percent |
+------------+-----------------------+
| Bharat     |               72.3876 |
| Savi       |               72.0059 |
| Devendra   |               68.0965 |
| Ashvini    |               50.0000 |
| Shrichand  |               49.6604 |
| Amisha     |               48.1848 |
| Manibalan  |               46.0317 |
| Mugdha     |               45.0704 |
| Pournamasi |               44.9256 |
| Divyansha  |               44.5161 |
+------------+-----------------------+
10 rows in set (0.004 sec)

MariaDB [online_sales]>