select * from orders;
select * from customers;

-- eraliest order date. 2009-05-17
select min(order_date) from orders;

-- orders with date range of 10 years of earliest order date.
select cust.name as NAME, cust.price as PRICE from (
SELECT 
    c.name, max_order.price, rank() over(ORDER BY max_order.price desc) as rank_price
FROM
    customers c
        JOIN
    (SELECT 
        id, price
    FROM
        orders
    WHERE
        order_date BETWEEN (SELECT 
                MIN(order_date)
            FROM
                orders) AND DATE_ADD((SELECT 
                MIN(order_date)
            FROM
                orders), INTERVAL 10 YEAR)) max_order ON c.order_id = max_order.id) cust where cust.rank_price < 2;