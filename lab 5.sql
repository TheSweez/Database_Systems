--select city
--from agents
--full outer join orders 
--on orders.aid = agents.aid
--where cid = 'c001'

--select products.pid
--from products
--full outer join orders
--on orders.pid =  products.pid
--where cid = 'c006'


--select name
--from customers
--where cid not in 
-- (select cid
-- from orders
-- where aid != cid)

--select name
--from customers
--left outer join orders 
--on orders.cid = customers.cid
--where orders.cid is null


--select distinct customers.name, agents.name
--from customers
--left outer join orders
--on customers.cid = orders.cid
--left outer join agents
--on orders.aid = agents.aid
--where customers.city = agents.city

--select customers.city as "City Name", customers.name as "Customer Name", agents.name as "Agent Name"
--from customers
--left outer join agents
--on customers.city = agents.city
--where customers.city = agents.city

--select customers.name as "Customer Name", customers.city as "Customer City"
--from customers, products 
--where customers.city = products.city and products.quantity = (
--select min(quantity)
--from products, customers 
--where customers.city = products.city)








