
/* Insert 5 orders with different values. 
2. Select all orders where quantity > 2.​
3. Select orders where price is between 100 and 500.​
4. Fetch orders with product_name starting with 'A'.​
5. Fetch orders sorted by quantity in descending order.​
6. Use CONCAT() to combine event_name and event_date. 
*/

use salesandservices;

select * from orders;
select * from order_items;

INSERT INTO orders (order_id, customer_name)
VALUES (3, 'Venkatesan');

insert into order_items (order_id, product_name, price, quantity) values
(3,'laptop',10000,4);

-- use comparsion operator --
select * from order_items
where quantity > 2;

-- use between--
select * from order_items
where price between 100 and 600;

-- use like--
select * from order_items
where product_name like 'M%';

-- use order by desc --
select * from order_items
order by quantity desc;

-- use concat()--
select 
concat(event_name , '-',event_date) as event_details from events;
       

