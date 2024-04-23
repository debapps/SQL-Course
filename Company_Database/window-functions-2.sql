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
     
-- CUME_DIST(): cumulative distribution. 
-- Value: 0 < cume_dist <= 1
-- Formula: Current Row No. (or Row No. with the same value as current row) / Total Number of Rows available in the table.

-- Question: Fetch all the product names which constitutes the first 30% of the expensive products based on price. 
with prod_dist as (
	select *,
	-- CUME_DIST() over(ORDER BY price desc) as cume_dist_value,
	round(CUME_DIST() over(ORDER BY price desc) * 100, 2) as cume_dist_percent_value
	from product
)

select product_name,
	   price,
       concat(cast(cume_dist_percent_value as CHAR), '%') as cume_dist_val_percent
  from prod_dist
 where cume_dist_percent_value <= 30;
 
-- PERCENT_RANK(): Relative rank of the current row. Value: 0 <  PERCENT_RANK <= 1. 
-- Formula: (Current Row No. - 1) / (Total No. of Rows - 1)

-- Question: How expensive is the Phone - Galaxy S23 Ultra compared to the other phones available in the product table (store).

select * from product where product_category = 'Phone' order by price desc;

with prod_percent_rank as (
	select *,
	PERCENT_RANK() OVER(PARTITION BY product_category ORDER BY price) as per_rank,
	round(PERCENT_RANK() OVER(PARTITION BY product_category ORDER BY price) * 100, 2) as rank_percentage_val
	from product
)

select product_name,
	   product_category,
       brand,
       price,
       concat(cast(rank_percentage_val as CHAR), '%') as price_rank_percentage
  from prod_percent_rank
 where product_name = 'Galaxy S23 Ultra';

































     
     