select * from product;

-- FIRST_VALUE(): Fetch a value appearing on the first record in the window.
-- Question: Get the most expensive product on each category along with all the product details.

select *,
FIRST_VALUE(product_name) over(PARTITION BY product_category ORDER BY price desc) as most_exp_product
from product; 

-- LAST_VALUE(): Fetch a value appearing on the last record in the window frame. Frame is the new concept here.
-- Default Frame: range between unbounded preceding and current row. 

-- Question: Get least expensive product under each category. 
select *,
FIRST_VALUE(product_name) 
over(PARTITION BY product_category ORDER BY price desc) as most_exp_product,
LAST_VALUE(product_name) 
over(PARTITION BY product_category ORDER BY price desc range between unbounded preceding and unbounded following) as least_exp_product
from product; 

-- Alternate ways to write above query.
select *,
FIRST_VALUE(product_name) over w as most_exp_product,
LAST_VALUE(product_name) over w as least_exp_product
from product
window w as 
   (PARTITION BY product_category 
    ORDER BY price desc 
	range between unbounded preceding 
              and unbounded following);  

-- NTH_VALUE(): Fetch a value specified in the query from window frame. 
-- It takes two arguments: column name whose value is returned and The N - number where Nth value need to be returned.

-- Get the second most expensive product under each category.
select *,
FIRST_VALUE(product_name) over w as most_exp_product,
LAST_VALUE(product_name) over w as least_exp_product,
NTH_VALUE(product_name, 2) over w as second_exp_product
from product
window w as 
   (PARTITION BY product_category 
    ORDER BY price desc 
	range between unbounded preceding 
              and unbounded following);   
              
-- NTILE(): It segregates the records in window into different buckets.

-- Question: Write a query to display all phone products and segregate those as premium phones, expensive phones,
-- mid-range phones and cheaper phones.

select phone.product_name,
	   phone.brand,
       case when phone.price_bucket = 1 then 'Premium Phone'
			when phone.price_bucket = 2 then 'Expensive Phone'
            when phone.price_bucket = 3 then 'Mid Range Phone'
            when phone.price_bucket = 4 then 'Cheap Phone'
	   end as price_range,
       phone.price
from (
	select *,
		   ntile(4) over(order by price desc) as price_bucket
	  from product
	 where product_category = 'Phone') phone; 
     
     