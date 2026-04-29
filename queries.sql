## BASIC QUERYING

## Q1. Fetch all users
SELECT * FROM Users;

## Q2. Get all restaurants
SELECT * FROM Restaurants;

## Q3. List all menu items
SELECT * FROM Menu;

## Q4. Show all orders
SELECT * FROM Orders;

## Q5. Get all order items
SELECT * FROM Order_Items;

## Q6. Fetch users from Bangalore
SELECT * FROM Users
WHERE address = 'Bangalore';

## Q7. Find restaurants with rating > 4.5
SELECT * FROM Restaurants
WHERE rating > 4.5;

## Q8. List menu items with price > 200
SELECT * FROM Menu
WHERE price > 200;

## Q9. Get orders with total_amount > 300
SELECT * FROM Orders
WHERE total_amount > 300;

## Q10. Find users whose name starts with 'R'
SELECT * FROM Users
WHERE name LIKE 'R%';

## Q11. Find users whose email contains 'gmail'
SELECT * FROM Users
WHERE email LIKE '%gmail%';

## Q12. Get menu items sorted by price
SELECT * FROM Menu
ORDER BY price;

## Q13. Get top 5 expensive menu items
SELECT * FROM Menu
ORDER BY price DESC
LIMIT 5;

## Q14. Find cheapest item
SELECT * FROM Menu
ORDER BY price ASC
LIMIT 1;

## Q15. Count total users
SELECT COUNT(*) FROM Users;

## Q16. Count total orders
SELECT COUNT(*) FROM Orders;

## Q17. Find distinct cities in users
SELECT DISTINCT address FROM Users;

## Q18. Find restaurants in Bangalore
SELECT * FROM Restaurants
WHERE location = 'Bangalore';

## Q19. Find orders placed today
SELECT * FROM Orders
WHERE DATE(order_date) = CURDATE();

## Q20. Get users sorted by name
SELECT * FROM Users
ORDER BY name;

## Q21. Find menu items between 100 and 200
SELECT * FROM Menu
WHERE price BETWEEN 100 AND 200;

## Q22. Find users with phone starting with 9
SELECT * FROM Users
WHERE phone LIKE '9%';

## Q23. Get orders sorted by amount descending
SELECT * FROM Orders
ORDER BY total_amount DESC;

## Q24. Find restaurants with rating between 4.2 and 4.6
SELECT * FROM Restaurants
WHERE rating BETWEEN 4.2 AND 4.6;

## Q25. List all unique item names
SELECT DISTINCT item_name FROM Menu;

## Q26. Find menu items ending with 'a'
SELECT * FROM Menu
WHERE item_name LIKE '%a';

## Q27. Get count of menu items per restaurant
SELECT restaurant_id, COUNT(*) 
FROM Menu
GROUP BY restaurant_id;

## Q28. Find average price of menu items
SELECT AVG(price) FROM Menu;

## Q29. Get max price item
SELECT * FROM Menu
WHERE price = (SELECT MAX(price) FROM Menu);

## Q30. Get min price item
SELECT * FROM Menu
WHERE price = (SELECT MIN(price) FROM Menu);

## Q31. Find users with 'a' in name
SELECT * FROM Users
WHERE name LIKE '%a%';

## Q32. Find orders with even order_id
SELECT * FROM Orders
WHERE order_id % 2 = 0;

## Q33. Get users with address length > 5
SELECT * FROM Users
WHERE LENGTH(address) > 5;

## Q34. Get menu items sorted alphabetically
SELECT * FROM Menu
ORDER BY item_name ASC;

## Q35. Find users with duplicate cities
SELECT address, COUNT(*)
FROM Users
GROUP BY address
HAVING COUNT(*) > 1;

## Q36. Get orders above average amount
SELECT * FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

## Q37. Find items with price not equal to 100
SELECT * FROM Menu
WHERE price <> 100;

## Q38. Get all records with NULL values
SELECT * FROM Users
WHERE name IS NULL OR email IS NULL OR phone IS NULL OR address IS NULL;

## Q39. Count total restaurants
SELECT COUNT(*) FROM Restaurants;

## Q40. Get latest order
SELECT * FROM Orders
ORDER BY order_date DESC
LIMIT 1;

## Q41. Join users and orders
SELECT * FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q42. Get user name with their orders
SELECT u.name, o.order_id, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q43. Join orders and order_items
SELECT * FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id;

## Q44. Join menu and order_items
SELECT * FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id;

## Q45. Get item name with quantity ordered
SELECT m.item_name, oi.quantity
FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id;

## Q46. Join all tables
SELECT * FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.menu_id = m.menu_id
JOIN Restaurants r ON m.restaurant_id = r.restaurant_id;

## Q47. Get user name, item name, quantity
SELECT u.name, m.item_name, oi.quantity
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.menu_id = m.menu_id;

## Q48. Get restaurant name with menu items
SELECT r.name, m.item_name
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id;

## Q49. Get restaurant with ordered items
SELECT r.name, m.item_name
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id;

## Q50. Find users who placed orders
SELECT DISTINCT u.*
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q51. Find users who did not place orders
SELECT * FROM Users
WHERE user_id NOT IN (SELECT user_id FROM Orders);

## Q52. Find restaurants with no orders
SELECT * FROM Restaurants r
WHERE r.restaurant_id NOT IN (
    SELECT m.restaurant_id
    FROM Menu m
    JOIN Order_Items oi ON m.menu_id = oi.menu_id
);

## Q53. Get orders with item details
SELECT o.order_id, m.item_name, oi.quantity
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.menu_id = m.menu_id;

## Q54. Find most ordered item
SELECT m.item_name, SUM(oi.quantity) AS total_qty
FROM Order_Items oi
JOIN Menu m ON oi.menu_id = m.menu_id
GROUP BY m.item_name
ORDER BY total_qty DESC
LIMIT 1;

## Q55. Get total quantity per item
SELECT m.item_name, SUM(oi.quantity)
FROM Order_Items oi
JOIN Menu m ON oi.menu_id = m.menu_id
GROUP BY m.item_name;

## Q56. Join and filter by price > 200
SELECT m.item_name, oi.quantity
FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id
WHERE m.price > 200;

## Q57. Join and sort by quantity
SELECT m.item_name, oi.quantity
FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id
ORDER BY oi.quantity DESC;

## Q58. Join and group by user
SELECT u.name, COUNT(o.order_id)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q59. Join and group by restaurant
SELECT r.name, COUNT(m.menu_id)
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
GROUP BY r.name;

## Q60. Join multiple conditions
SELECT u.name, m.item_name, oi.quantity
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.menu_id = m.menu_id
WHERE m.price > 200 AND oi.quantity >= 1;

## Q61. Find orders with multiple items
SELECT order_id, COUNT(*) 
FROM Order_Items
GROUP BY order_id
HAVING COUNT(*) > 1;

## Q62. Get total bill using join
SELECT o.order_id, SUM(oi.subtotal) AS total_bill
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

## Q63. Find restaurant revenue
SELECT r.name, SUM(oi.subtotal) AS revenue
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY r.name;

## Q64. Get top restaurant by orders
SELECT r.name, COUNT(*) AS total_orders
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY r.name
ORDER BY total_orders DESC
LIMIT 1;

## Q65. Find users with max orders
SELECT u.name, COUNT(o.order_id) AS total_orders
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY total_orders DESC
LIMIT 1;

## Q66. Get item frequency
SELECT m.item_name, COUNT(*) AS frequency
FROM Order_Items oi
JOIN Menu m ON oi.menu_id = m.menu_id
GROUP BY m.item_name;

## Q67. Join and use HAVING
SELECT u.name, COUNT(o.order_id) AS total_orders
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING COUNT(o.order_id) > 1;

## Q68. Join with subquery
SELECT * FROM Users
WHERE user_id IN (SELECT user_id FROM Orders);

## Q69. Join with window function
SELECT u.name, o.order_id,
RANK() OVER (ORDER BY o.total_amount DESC) AS rank_amt
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q70. Join and filter NULL values
SELECT u.name, oi.order_id
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

## Q71. Join and find unmatched records
SELECT u.*
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

## Q72. Join using aliases
SELECT u.name, o.order_id
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q73. Join and count items per order
SELECT o.order_id, COUNT(oi.menu_id) AS total_items
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

## Q74. Join and sum quantities
SELECT o.order_id, SUM(oi.quantity) AS total_qty
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

## Q75. Join and calculate average order
SELECT AVG(total_amount) FROM Orders;

## Q76. Join and get top users
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 3;

## Q77. Join and filter by city
SELECT u.name, o.order_id
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE u.address = 'Bangalore';

## Q78. Join and filter by rating
SELECT r.name, m.item_name
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
WHERE r.rating > 4.5;

## Q79. Join and use CASE
SELECT u.name,
CASE 
    WHEN o.total_amount > 300 THEN 'High'
    ELSE 'Low'
END AS order_type
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q80. Join and rank results
SELECT u.name, o.total_amount,
RANK() OVER (ORDER BY o.total_amount DESC) AS rank_order
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q81. Join and partition data
SELECT u.name, o.total_amount,
ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY o.total_amount DESC) AS rn
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q82. Join and sort descending
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
ORDER BY o.total_amount DESC;

## Q83. Join and find duplicates
SELECT u.user_id, COUNT(o.order_id)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_id
HAVING COUNT(o.order_id) > 1;

## Q84. Join and remove duplicates
SELECT DISTINCT u.name
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q85. Join and use limit
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
LIMIT 5;

## Q86. Join and paginate results
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
LIMIT 5 OFFSET 5;

## Q87. Join and group multiple columns
SELECT u.name, u.address, COUNT(o.order_id)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name, u.address;

## Q88. Join and calculate percentages
SELECT u.name,
SUM(o.total_amount) * 100 / (SELECT SUM(total_amount) FROM Orders) AS percentage
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q89. Join and compare values
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount > 300;

## Q90. Join and filter top N
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
ORDER BY o.total_amount DESC
LIMIT 3;

## Q91. Join and use derived table
SELECT t.user_id, t.total
FROM (
    SELECT user_id, SUM(total_amount) AS total
    FROM Orders
    GROUP BY user_id
) t
JOIN Users u ON t.user_id = u.user_id;

## Q92. Join and nested query
SELECT * FROM Users
WHERE user_id IN (
    SELECT user_id FROM Orders WHERE total_amount > 300
);

## Q93. Join performance question
SELECT u.name, o.order_id
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q94. Join indexing scenario
CREATE INDEX idx_user_id ON Orders(user_id);

## Q95. Join execution plan question
EXPLAIN SELECT u.name, o.order_id
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q96. Join optimization case
SELECT u.name, o.order_id
FROM Users u
INNER JOIN Orders o ON u.user_id = o.user_id;

## Q97. Join large table scenario
SELECT u.name, COUNT(o.order_id)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q98. Join real-world problem
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q99. Join with multiple aggregations
SELECT u.name,
COUNT(o.order_id),
SUM(o.total_amount),
AVG(o.total_amount)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q100. Complex join scenario
SELECT u.name, r.name, m.item_name, oi.quantity
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu m ON oi.menu_id = m.menu_id
JOIN Restaurants r ON m.restaurant_id = r.restaurant_id;

## GROUP BY AND HAVING

## Q101. Count orders per user
SELECT user_id, COUNT(order_id)
FROM Orders
GROUP BY user_id;

## Q102. Count items per order
SELECT order_id, COUNT(menu_id)
FROM Order_Items
GROUP BY order_id;

## Q103. Total sales per restaurant
SELECT r.name, SUM(oi.subtotal)
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY r.name;

## Q104. Average order amount per user
SELECT user_id, AVG(total_amount)
FROM Orders
GROUP BY user_id;

## Q105. Max order per user
SELECT user_id, MAX(total_amount)
FROM Orders
GROUP BY user_id;

## Q106. Min order per user
SELECT user_id, MIN(total_amount)
FROM Orders
GROUP BY user_id;

## Q107. Group by restaurant
SELECT r.name, COUNT(m.menu_id)
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
GROUP BY r.name;

## Q108. Group by city
SELECT address, COUNT(*)
FROM Users
GROUP BY address;

## Q109. Group by item
SELECT m.item_name, SUM(oi.quantity)
FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY m.item_name;

## Q110. Use HAVING count > 1
SELECT order_id, COUNT(*)
FROM Order_Items
GROUP BY order_id
HAVING COUNT(*) > 1;

## Q111. Use HAVING sum > 300
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > 300;

## Q112. Find top spending users
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 3;

## Q113. Find low spending users
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY total_spent ASC
LIMIT 3;

## Q114. Find restaurants with highest sales
SELECT r.name, SUM(oi.subtotal) AS revenue
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY r.name
ORDER BY revenue DESC
LIMIT 1;

## Q115. Find least popular items
SELECT m.item_name, SUM(oi.quantity) AS total_qty
FROM Menu m
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY m.item_name
ORDER BY total_qty ASC
LIMIT 3;

## Q116. Group and sort
SELECT user_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY user_id
ORDER BY total_orders DESC;

## Q117. Group multiple columns
SELECT user_id, order_date, COUNT(*)
FROM Orders
GROUP BY user_id, order_date;

## Q118. Group and join
SELECT u.name, COUNT(o.order_id)
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name;

## Q119. Group and subquery
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > (SELECT AVG(total_amount) FROM Orders);

## Q120. Group and window
SELECT user_id, total_amount,
RANK() OVER (PARTITION BY user_id ORDER BY total_amount DESC) AS rnk
FROM Orders;

## Q121. Find duplicate users
SELECT email, COUNT(*)
FROM Users
GROUP BY email
HAVING COUNT(*) > 1;

## Q122. Remove duplicates using group
SELECT MIN(user_id), name, email
FROM Users
GROUP BY name, email;

## Q123. Count distinct users
SELECT COUNT(DISTINCT user_id) FROM Users;

## Q124. Sum subtotal per order
SELECT order_id, SUM(subtotal)
FROM Order_Items
GROUP BY order_id;

## Q125. Average item price per restaurant
SELECT r.name, AVG(m.price)
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
GROUP BY r.name;

## Q126. Group and filter date
SELECT DATE(order_date), COUNT(*)
FROM Orders
GROUP BY DATE(order_date)
HAVING DATE(order_date) = CURDATE();

## Q127. Monthly sales
SELECT MONTH(order_date), SUM(total_amount)
FROM Orders
GROUP BY MONTH(order_date);

## Q128. Yearly sales
SELECT YEAR(order_date), SUM(total_amount)
FROM Orders
GROUP BY YEAR(order_date);

## Q129. Group by hour
SELECT HOUR(order_date), COUNT(*)
FROM Orders
GROUP BY HOUR(order_date);

## Q130. Group and use CASE
SELECT 
CASE 
    WHEN total_amount > 300 THEN 'High'
    ELSE 'Low'
END AS category,
COUNT(*)
FROM Orders
GROUP BY category;

## Q131. Conditional aggregation
SELECT 
SUM(CASE WHEN total_amount > 300 THEN 1 ELSE 0 END) AS high_orders,
SUM(CASE WHEN total_amount <= 300 THEN 1 ELSE 0 END) AS low_orders
FROM Orders;

## Q132. Count items > 200 price
SELECT COUNT(*) 
FROM Menu
WHERE price > 200;

## Q133. Find users with more than 2 orders
SELECT user_id, COUNT(order_id)
FROM Orders
GROUP BY user_id
HAVING COUNT(order_id) > 2;

## Q134. Find restaurants with more than 5 items
SELECT restaurant_id, COUNT(menu_id)
FROM Menu
GROUP BY restaurant_id
HAVING COUNT(menu_id) > 5;

## Q135. Group and use ranking
SELECT user_id, total_amount,
RANK() OVER (PARTITION BY user_id ORDER BY total_amount DESC) AS rnk
FROM Orders;

## Q136. Group and use limit
SELECT user_id, SUM(total_amount) AS total
FROM Orders
GROUP BY user_id
ORDER BY total DESC
LIMIT 3;

## Q137. Group and derived table
SELECT *
FROM (
    SELECT user_id, SUM(total_amount) AS total
    FROM Orders
    GROUP BY user_id
) t;

## Q138. Group and nested query
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > (SELECT AVG(total_amount) FROM Orders);

## Q139. Group performance scenario
SELECT user_id, COUNT(*)
FROM Orders
GROUP BY user_id;

## Q140. Group optimization
CREATE INDEX idx_orders_user_id ON Orders(user_id);

## Q141. Group vs window
SELECT user_id, SUM(total_amount) AS total,
SUM(total_amount) OVER (PARTITION BY user_id) AS window_total
FROM Orders
GROUP BY user_id;

## Q142. Group edge cases
SELECT user_id, COUNT(*)
FROM Orders
GROUP BY user_id
HAVING COUNT(*) >= 1;

## Q143. Group with NULL values
SELECT user_id, COUNT(*)
FROM Orders
WHERE user_id IS NOT NULL
GROUP BY user_id;

## Q144. Group large dataset
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id;

## Q145. Group and partition
SELECT user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id) AS total_per_user
FROM Orders;

## Q146. Group and cumulative sum
SELECT order_id, user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_id) AS running_total
FROM Orders;

## Q147. Group and difference
SELECT order_id, user_id, total_amount,
total_amount - LAG(total_amount) OVER (PARTITION BY user_id ORDER BY order_id) AS diff
FROM Orders;

## Q148. Group complex problem
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
ORDER BY total_spent DESC;

## Q149. Group advanced scenario
SELECT user_id, COUNT(order_id) AS total_orders,
AVG(total_amount) AS avg_amount
FROM Orders
GROUP BY user_id
HAVING AVG(total_amount) > 200;

## Q150. Group real-world case
SELECT r.name, SUM(oi.subtotal) AS revenue
FROM Restaurants r
JOIN Menu m ON r.restaurant_id = m.restaurant_id
JOIN Order_Items oi ON m.menu_id = oi.menu_id
GROUP BY r.name
ORDER BY revenue DESC;

##SUBQUERIES

## Q151. Find users with highest order
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount = (SELECT MAX(total_amount) FROM Orders);

## Q152. Find second highest order
SELECT DISTINCT total_amount
FROM Orders
ORDER BY total_amount DESC
LIMIT 1 OFFSET 1;

## Q153. Find users above average spend
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount > (SELECT AVG(total_amount) FROM Orders);

## Q154. Find items above average price
SELECT * FROM Menu
WHERE price > (SELECT AVG(price) FROM Menu);

## Q155. Subquery in SELECT
SELECT name,
(SELECT COUNT(*) FROM Orders o WHERE o.user_id = u.user_id) AS total_orders
FROM Users u;

## Q156. Subquery in WHERE
SELECT * FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

## Q157. Subquery in FROM
SELECT avg_table.avg_amount
FROM (
    SELECT AVG(total_amount) AS avg_amount FROM Orders
) avg_table;

## Q158. Correlated subquery example
SELECT u.name
FROM Users u
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.user_id = u.user_id
);

## Q159. Find max order per user
SELECT user_id, MAX(total_amount)
FROM Orders
GROUP BY user_id;

## Q160. Find users with no orders
SELECT * FROM Users u
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.user_id = u.user_id
);

## Q161. EXISTS example
SELECT name FROM Users u
WHERE EXISTS (
    SELECT 1 FROM Orders o WHERE o.user_id = u.user_id
);

## Q162. NOT EXISTS example
SELECT name FROM Users u
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o WHERE o.user_id = u.user_id
);

## Q163. IN vs EXISTS
SELECT * FROM Users
WHERE user_id IN (SELECT user_id FROM Orders);

## Q164. Subquery with join
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount > (
    SELECT AVG(total_amount) FROM Orders
);

## Q165. Subquery with group
SELECT user_id
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount) FROM Orders
);

## Q166. Subquery with having
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount) FROM Orders
);

## Q167. Subquery with order
SELECT * FROM Orders
ORDER BY total_amount DESC;

## Q168. Subquery with limit
SELECT * FROM Orders
WHERE total_amount = (
    SELECT MAX(total_amount) FROM Orders
);

## Q169. Nested subqueries
SELECT * FROM Users
WHERE user_id IN (
    SELECT user_id FROM Orders
    WHERE total_amount > (
        SELECT AVG(total_amount) FROM Orders
    )
);

## Q170. Scalar subquery
SELECT name,
(SELECT MAX(total_amount) FROM Orders) AS max_order
FROM Users;

## Q171. Multi-row subquery
SELECT * FROM Users
WHERE user_id IN (SELECT user_id FROM Orders);

## Q172. Subquery in update
UPDATE Users
SET address = 'Updated City'
WHERE user_id IN (SELECT user_id FROM Orders);

## Q173. Subquery in delete
DELETE FROM Users
WHERE user_id NOT IN (SELECT user_id FROM Orders);

## Q174. Subquery performance
SELECT * FROM Orders
WHERE user_id IN (SELECT user_id FROM Users);

## Q175. Rewrite subquery as join
SELECT DISTINCT u.*
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q176. Subquery optimization
SELECT * FROM Orders o
WHERE EXISTS (SELECT 1 FROM Users u WHERE u.user_id = o.user_id);

## Q177. Subquery pitfalls
SELECT * FROM Users
WHERE user_id NOT IN (SELECT user_id FROM Orders WHERE user_id IS NOT NULL);

## Q178. Subquery execution plan
EXPLAIN SELECT * FROM Orders
WHERE user_id IN (SELECT user_id FROM Users);

## Q179. Subquery with window
SELECT user_id, total_amount,
AVG(total_amount) OVER () AS avg_val
FROM Orders;

## Q180. Subquery complex scenario
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount > (
    SELECT AVG(total_amount) FROM Orders
);

## Q181. Derived table usage
SELECT t.user_id, t.total
FROM (
    SELECT user_id, SUM(total_amount) AS total
    FROM Orders
    GROUP BY user_id
) t;

## Q182. Inline view
SELECT * FROM (
    SELECT user_id, total_amount FROM Orders
) AS temp;

## Q183. Subquery with CASE
SELECT name,
CASE 
    WHEN user_id IN (SELECT user_id FROM Orders) THEN 'Active'
    ELSE 'Inactive'
END AS status
FROM Users;

## Q184. Subquery with aggregation
SELECT * FROM Orders
WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);

## Q185. Subquery with date
SELECT * FROM Orders
WHERE DATE(order_date) = (
    SELECT DATE(MAX(order_date)) FROM Orders
);

## Q186. Subquery with string
SELECT * FROM Users
WHERE name IN (SELECT name FROM Users WHERE name LIKE 'R%');

## Q187. Subquery with numeric
SELECT * FROM Menu
WHERE price > (SELECT AVG(price) FROM Menu);

## Q188. Subquery real-world problem
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING SUM(o.total_amount) > (
    SELECT AVG(total_amount) FROM Orders
);

## Q189. Subquery debugging
SELECT * FROM Orders
WHERE user_id IN (SELECT user_id FROM Users);

## Q190. Subquery ranking
SELECT user_id, total_amount,
RANK() OVER (ORDER BY total_amount DESC) AS rnk
FROM Orders;

## Q191. Subquery filtering
SELECT * FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount) FROM Orders
);

## Q192. Subquery grouping
SELECT user_id, SUM(total_amount)
FROM Orders
GROUP BY user_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount) FROM Orders
);

## Q193. Subquery ordering
SELECT * FROM Orders
WHERE total_amount = (
    SELECT MAX(total_amount) FROM Orders
)
ORDER BY total_amount DESC;

## Q194. Subquery top N
SELECT * FROM Orders
WHERE total_amount IN (
    SELECT total_amount FROM Orders
    ORDER BY total_amount DESC
    LIMIT 3
);

## Q195. Subquery duplicates
SELECT name
FROM Users
WHERE name IN (
    SELECT name FROM Users
    GROUP BY name
    HAVING COUNT(*) > 1
);

## Q196. Subquery nested join
SELECT u.name, o.total_amount
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE o.total_amount > (
    SELECT AVG(total_amount) FROM Orders
);

## Q197. Subquery multi-condition
SELECT * FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount) FROM Orders
)
AND user_id IN (
    SELECT user_id FROM Users WHERE address = 'Bangalore'
);

## Q198. Subquery advanced logic
SELECT * FROM Users
WHERE user_id IN (
    SELECT user_id FROM Orders
    GROUP BY user_id
    HAVING SUM(total_amount) > 300
);

## Q199. Subquery case study
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.name
HAVING total_spent > (
    SELECT AVG(total_amount) FROM Orders
);

## Q200. Complex subquery problem
SELECT * FROM Users
WHERE user_id IN (
    SELECT user_id FROM Orders
    WHERE total_amount > (
        SELECT AVG(total_amount) FROM Orders
    )
);

##WINDOW FUNCTIONS

## Q201. Assign row number to orders
SELECT order_id, user_id,
ROW_NUMBER() OVER (ORDER BY order_id) AS rn
FROM Orders;

## Q202. Rank users by spending
SELECT user_id, SUM(total_amount) AS total_spent,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rnk
FROM Orders
GROUP BY user_id;

## Q203. Dense rank users
SELECT user_id, SUM(total_amount) AS total_spent,
DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS drnk
FROM Orders
GROUP BY user_id;

## Q204. Partition by user
SELECT order_id, user_id,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_id) AS rn
FROM Orders;

## Q205. Running total of orders
SELECT order_id, user_id, total_amount,
SUM(total_amount) OVER (ORDER BY order_id) AS running_total
FROM Orders;

## Q206. Moving average of orders
SELECT order_id, total_amount,
AVG(total_amount) OVER (ORDER BY order_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM Orders;

## Q207. Lead function for next order
SELECT order_id, total_amount,
LEAD(total_amount) OVER (ORDER BY order_id) AS next_order
FROM Orders;

## Q208. Lag function for previous order
SELECT order_id, total_amount,
LAG(total_amount) OVER (ORDER BY order_id) AS prev_order
FROM Orders;

## Q209. First order per user
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) AS rn
    FROM Orders
) t
WHERE rn = 1;

## Q210. Last order per user
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date DESC) AS rn
    FROM Orders
) t
WHERE rn = 1;

## Q211. Top 3 items per restaurant
SELECT * FROM (
    SELECT m.restaurant_id, m.item_name, m.price,
    ROW_NUMBER() OVER (PARTITION BY m.restaurant_id ORDER BY m.price DESC) AS rn
    FROM Menu m
) t
WHERE rn <= 3;

## Q212. Remove duplicates using row_number
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_id) AS rn
    FROM Orders
) t
WHERE rn = 1;

## Q213. Gap and island problem
SELECT order_id, user_id,
order_id - ROW_NUMBER() OVER (ORDER BY order_id) AS grp
FROM Orders;

## Q214. Session analysis
SELECT user_id, order_date,
LAG(order_date) OVER (PARTITION BY user_id ORDER BY order_date) AS prev_date
FROM Orders;

## Q215. Window with join
SELECT u.name, o.total_amount,
RANK() OVER (ORDER BY o.total_amount DESC) AS rnk
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q216. Window with group
SELECT user_id, SUM(total_amount) AS total,
RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rnk
FROM Orders
GROUP BY user_id;

## Q217. Window with subquery
SELECT *, RANK() OVER (ORDER BY total_amount DESC) AS rnk
FROM (
    SELECT * FROM Orders
) t;

## Q218. Window with CTE
WITH temp AS (
    SELECT * FROM Orders
)
SELECT *, ROW_NUMBER() OVER (ORDER BY order_id) FROM temp;

## Q219. Window performance
SELECT user_id, total_amount,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_id)
FROM Orders;

## Q220. Window optimization
CREATE INDEX idx_orders_user ON Orders(user_id);

## Q221. Window partitioning
SELECT user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id)
FROM Orders;

## Q222. Window sorting
SELECT order_id, total_amount,
ROW_NUMBER() OVER (ORDER BY total_amount DESC)
FROM Orders;

## Q223. Window frame clause
SELECT order_id, total_amount,
SUM(total_amount) OVER (ORDER BY order_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM Orders;

## Q224. Window ranking
SELECT order_id, total_amount,
RANK() OVER (ORDER BY total_amount DESC)
FROM Orders;

## Q225. Window aggregation
SELECT order_id, total_amount,
AVG(total_amount) OVER ()
FROM Orders;

## Q226. Window cumulative sum
SELECT order_id, total_amount,
SUM(total_amount) OVER (ORDER BY order_id)
FROM Orders;

## Q227. Window difference
SELECT order_id, total_amount,
total_amount - LAG(total_amount) OVER (ORDER BY order_id)
FROM Orders;

## Q228. Window with date
SELECT order_id, order_date,
ROW_NUMBER() OVER (ORDER BY order_date)
FROM Orders;

## Q229. Window with string
SELECT name,
ROW_NUMBER() OVER (ORDER BY name)
FROM Users;

## Q230. Window with numeric
SELECT order_id, total_amount,
RANK() OVER (ORDER BY total_amount)
FROM Orders;

## Q231. Window with CASE
SELECT user_id, total_amount,
CASE 
    WHEN total_amount > 300 THEN 'High'
    ELSE 'Low'
END AS category,
RANK() OVER (ORDER BY total_amount DESC)
FROM Orders;

## Q232. Window filtering
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS rn
    FROM Orders
) t
WHERE rn <= 5;

## Q233. Window advanced problem
SELECT user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_id) AS running_total
FROM Orders;

## Q234. Window real-world case
SELECT u.name, o.total_amount,
RANK() OVER (ORDER BY o.total_amount DESC) AS rank_order
FROM Users u
JOIN Orders o ON u.user_id = o.user_id;

## Q235. Window analytics
SELECT order_id, total_amount,
AVG(total_amount) OVER () AS avg_val,
MAX(total_amount) OVER () AS max_val
FROM Orders;

## Q236. Window debugging
SELECT order_id, total_amount,
ROW_NUMBER() OVER (ORDER BY order_id)
FROM Orders;

## Q237. Window execution plan
EXPLAIN SELECT order_id,
ROW_NUMBER() OVER (ORDER BY order_id)
FROM Orders;

## Q238. Window vs group by
SELECT user_id,
SUM(total_amount) AS grp_total,
SUM(total_amount) OVER (PARTITION BY user_id) AS win_total
FROM Orders
GROUP BY user_id;

## Q239. Window vs subquery
SELECT order_id, total_amount,
(SELECT AVG(total_amount) FROM Orders) AS avg_val,
AVG(total_amount) OVER () AS win_avg
FROM Orders;

## Q240. Window edge cases
SELECT user_id, total_amount,
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total_amount DESC)
FROM Orders;

## Q241. Window large dataset
SELECT user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id)
FROM Orders;

## Q242. Window partition multiple columns
SELECT user_id, order_date, total_amount,
ROW_NUMBER() OVER (PARTITION BY user_id, order_date ORDER BY total_amount DESC)
FROM Orders;

## Q243. Window nested query
SELECT * FROM (
    SELECT *, RANK() OVER (ORDER BY total_amount DESC) AS rnk
    FROM Orders
) t
WHERE rnk <= 3;

## Q244. Window derived table
SELECT t.order_id, t.total_amount, t.rnk
FROM (
    SELECT order_id, total_amount,
    RANK() OVER (ORDER BY total_amount DESC) AS rnk
    FROM Orders
) t;

## Q245. Window alias usage
SELECT order_id, total_amount,
ROW_NUMBER() OVER (ORDER BY total_amount) AS row_num
FROM Orders;

## Q246. Window duplicate handling
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_id) AS rn
    FROM Orders
) t
WHERE rn = 1;

## Q247. Window top N per group
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total_amount DESC) AS rn
    FROM Orders
) t
WHERE rn <= 3;

## Q248. Window ranking tie handling
SELECT order_id, total_amount,
DENSE_RANK() OVER (ORDER BY total_amount DESC) AS drnk
FROM Orders;

## Q249. Window optimization scenario
CREATE INDEX idx_orders_total ON Orders(total_amount);

## Q250. Complex window function problem
SELECT user_id, total_amount,
SUM(total_amount) OVER (PARTITION BY user_id ORDER BY order_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum,
RANK() OVER (PARTITION BY user_id ORDER BY total_amount DESC) AS rank_per_user
FROM Orders;

##END OF THIS PROJECT
