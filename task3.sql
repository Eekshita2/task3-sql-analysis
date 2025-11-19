-- Query 1: Select all customers --
SELECT * 
FROM customers;

-- Query 2: Orders with amount greater than 500 --
SELECT * 
FROM orders
WHERE amount > 500;

-- Query 3: Sort products by price (High to Low) --
SELECT * 
FROM products
ORDER BY price DESC;

-- Query 4: Total sales by category (JOIN + GROUP BY) --
SELECT p.category,
       SUM(o.amount) AS total_sales
FROM products p
JOIN orders o 
     ON p.product_id = o.product_id
GROUP BY p.category;

-- Query 5: Customer names with their order IDs and amounts (JOIN) --
SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
JOIN orders o 
     ON c.customer_id = o.customer_id;

-- Query 6: Customers with total spending > 1000 (SUBQUERY) --
SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(amount) > 1000
);

-- Query 7: Create a view showing total spending per customer --
CREATE VIEW customer_sales AS
SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o 
     ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Query 7 Output: Display the view data --
SELECT * 
FROM customer_sales;

-- Query 8: Handle NULL address values using COALESCE --
SELECT customer_name,
       COALESCE(address, 'Not Provided') AS cleaned_address
FROM customers;
