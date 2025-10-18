select * , (select customer_id from orders as o where o.id = od.order_id)
	as customer_id from order_details as od;
    
select * from order_details as od 
	where od.order_id in (select o.id from orders as o where o.shipper_id = 3);
    
select t.order_id, avg(t.quantity) as average 
	from (select * from order_details as od where quantity > 10) as t
	group by t.order_id;
    
with temp as (
	select * 
    from order_details as od 
    where od.quantity > 10
)
select t.order_id, avg(t.quantity) as average from temp as t 
	group by t.order_id;
    
    
DELIMITER //
CREATE FUNCTION devide(num1 FLOAT, num2 FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
	DECLARE result FLOAT;
    SET result = num1 / num2;
    RETURN result;
END //
DELIMITER ;

select order_id, hw3.devide(quantity, 10) as calculated from order_details;
    
DROP FUNCTION IF EXISTS hw3.devide;