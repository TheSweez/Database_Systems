--select aid, city
--from agents 
--where aid in
--   (select aid
--    from orders
--    where cid = 'c001')

--select pid
--from products
--where pid in 
--   (select pid
--    from orders
--    where cid = 'c006')


--select cid, name
--from customers
--where cid in
--   (select cid
--    from orders
--    where cid != 'c001')

--select cid, name
--from customers
--where cid in
--  (select cid
--  from orders
--   where customers.cid = orders.pid
--   and pid = 'p01'
--   or pid = 'p07')

	
--select pid 
--from products
--where pid in
--   (select pid
--    from orders
--    where aid = 'a04')

--select name, discount
--from customers
--where cid in
--   (select cid
--    from orders
--    where aid = 'a06'
--    or aid = 'a02')

--select name
--from customers
--where discount in
--   (select discount
--    from customers
--    where discount = '8.00'
--    or discount = '0.00')   