-- select make of bike. return model, year of bike --

CREATE FUNCTION getSpecs(brand TEXT, OUT bikeMake TEXT, OUT bikeModel VARCHAR, OUT bikeYear INT) 
RETURNS SETOF RECORD AS $$

BEGIN
RETURN QUERY select make, model, year
FROM bikes
WHERE bikes.make = brand;
END;

$$ LANGUAGE plpgsql;

select * from getSpecs('KTM');

-- search quantity of an order. return ordno, customer name, itemid, month, price of individual item.--

CREATE FUNCTION getQuant(number INT, OUT orderQuantity INT, OUT orderNo CHAR, OUT orderMonth TEXT)
RETURNS SETOF RECORD AS $$

BEGIN
RETURN QUERY select customer.firstName||' '||customer.lastName, orders.quantity, orders.ordno, orders.month 
FROM orders
WHERE orders.quantity = number;
END;
 
$$ LANGUAGE plpgsql;

select * from getQuant(1);




