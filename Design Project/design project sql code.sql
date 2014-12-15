DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS inventory_orders;
DROP TABLE IF EXISTS bikes;

-- People -- 
CREATE TABLE people (
pid char(4) not null,
firstName text not null,
lastName text not null,
phoneNumber varchar(255),
primary key(pid)
);

-- Customers --
CREATE TABLE customers (
cid char(4) not null,
pid char(4) not null REFERENCES people(pid),
primary key(cid)
);

-- Store --
CREATE TABLE store (
storeID char(4) not null,
state text,
town text,
storeName text,
primary key(storeID)
);

-- Staff --
CREATE TABLE staff (
sid char(4) not null,
pid char(4) not null REFERENCES people(pid),
storeID char(4) not null REFERENCES store(storeID),
address text,
email varchar(255),
birthDate date,
primary key(sid)
);

-- Bikes --
CREATE TABLE bikes (
bikeID char(3) not null,
make text,
model varchar(255),
year int,
primary key(bikeID)
);

-- Inventory --
CREATE TABLE inventory (
itemID char(4) not null,
bikeID char(3) not null REFERENCES bikes(bikeID),
storeID char(4) not null REFERENCES store(storeID),
price int,
amt_in_stock int,
primary key(itemID)
);


-- Orders --
CREATE TABLE orders (
ordno char(4) not null,
cid char(4) not null REFERENCES customers(cid),
itemID char(4) not null REFERENCES inventory(itemID),
month text,
quantity int,
total_price int,
primary key(ordno)
);

CREATE TABLE inventory_orders (
itemID char(4) not null REFERENCES inventory(itemID),
ordno char(4) not null REFERENCES orders(ordno),
primary key(itemID, ordno)
);

-------------------------------------------------------------DATA---------------------------------------------------------------------------------

-- People --
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p001', 'Chris', 'Kringle', '9738887777');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p002', 'Dan', 'Swezey', '9731234567');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p003', 'Dave', 'Medvedev', '8452611191');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p004', 'Brian', 'Berkeley', '2019028856');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p005', 'Steven', 'Heck', '2015556664');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p006', 'Matt', 'Spratt', '9149606810');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p007', 'Nick', 'Laporta', '9148886665');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p008', 'Kevin', 'Bacon', '2016996969');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p009', 'Joe', 'Schmo', '9738654444');
  
INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p010', 'Josh', 'Darnel', '9736749013');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p011', 'Mike', 'Bro', '9735554444');  

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p012', 'Boby', 'Jones', '2011234567');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p013', 'ParkRanger', 'Donald', '2019998898');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p014', 'Dingus', 'Khan', '2015567453');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p015', 'Dani', 'Herbs', '9736666666');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p016', 'Steph', 'Cats', '9736856859');

INSERT INTO people( pid, firstName, lastName, phoneNumber )
  VALUES('p017', 'Kate', 'Ulfs', '2013152365');

  
-- Customers --
INSERT INTO customers( cid, pid )
  VALUES('c001', 'p001');
  
INSERT INTO customers( cid, pid )
  VALUES('c002', 'p002');

INSERT INTO customers( cid, pid )
  VALUES('c003', 'p003');
  
INSERT INTO customers( cid, pid )
  VALUES('c004', 'p004');

INSERT INTO customers( cid, pid )
  VALUES('c005', 'p005');
  
INSERT INTO customers( cid, pid )
  VALUES('c006', 'p006');

INSERT INTO customers( cid, pid )
  VALUES('c007', 'p007');
  
INSERT INTO customers( cid, pid )
  VALUES('c008', 'p008');

INSERT INTO customers( cid, pid )
  VALUES('c009', 'p009');
  
INSERT INTO customers( cid, pid )
  VALUES('c010', 'p010');

-- Store --
INSERT INTO store( storeID, state, town, storeName )
  VALUES('st01', 'New Jersey', 'Pequannock', 'Moto of Pequannock');

INSERT INTO store( storeID, state, town, storeName )
  VALUES('st02', 'New Jersey', 'Wayne', 'Moto of Wayne');

INSERT INTO store( storeID, state, town, storeName )
  VALUES('st03', 'New York', 'Poughkeepsie', 'Moto of Poughkeepsie');


-- Staff --
INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s001', 'p001', 'st01', '1 Whipple Road, 07444', 'chris@gmail.com', '11-11-1994');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s002', 'p002', 'st01', '2 Copley Court, 73232', 'dan@gmail.com', '12-12-1990');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s003', 'p011', 'st01', '3 Forest Hills Dr, 67584', 'mike@optonline.net', '1-1-1992');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s004', 'p012', 'st02', '4 Sunset Ave, 15243', 'boby@optonline.net', '2-2-1985');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s005', 'p013', 'st02', '5 West Parkway, 10987', 'parkRangerDonald@hotmail.com', '3-3-1980');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s006', 'p014', 'st02', '6 Arundel St, 11456', 'dingus@gmail.com', '4-4-1988');

INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s007', 'p015', 'st03', '7 Boulevard Rd, 10925', 'dani@hotmail.com', '5-5-1979');
  
INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s008', 'p016', 'st03', '8 Kimble Court, 85964', 'steph@gmail.com', '6-6-1978');
  
INSERT INTO staff( sid, pid, storeID, address, email, birthDate )
  VALUES('s009', 'p017', 'st03', '9 Cameron Ave, 12333', 'Ulfs@optonline.net', '7-7-1969');

-- Bikes --
INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b01', 'Honda', 'CRF150F', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b02', 'Honda', 'CRF450R', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b03', 'KTM', '125 EXC', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b04', 'KTM', '660 SMC', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b05', 'Yamaha', 'SRX 120', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b06', 'Yamaha', 'YFZ450', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b07', 'Suzuki', 'LT500R', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b08', 'Suzuki', 'ALT50', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b09', 'Kawasaki', 'KX250', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b10', 'Kawasaki', 'KMX 125', '2014');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b11', 'Honda', 'CRF150R', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b12', 'Honda', 'CRF250F', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b13', 'KTM', '525 XC', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b14', 'KTM', '400 EXC', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b15', 'Yamaha', 'Tri-Z 250', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b16', 'Yamaha', 'Warrior 350', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b17', 'Suzuki', 'Kingquad 750', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b18', 'Suzuki', 'Qzark 250', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b19', 'Kawasaki', 'KLX650R', '2015');

INSERT INTO bikes( bikeID, make, model, year )
  VALUES('b20', 'Kawasaki', 'KDX420', '2015');

  -- Inventory --
INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i001', 'b01' ,'st01' ,'5000' ,'8');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i002', 'b02' ,'st01' ,'5500' ,'10');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i003', 'b03' ,'st01' ,'4900' ,'5');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i004', 'b04' ,'st01' ,'5100' ,'6');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i005', 'b05' ,'st01' ,'3350' ,'7');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i006', 'b06' ,'st01' ,'4250' ,'8');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i007', 'b07' ,'st01' ,'5200' ,'6');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i008', 'b08' ,'st02' ,'5450' ,'7');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i009', 'b09' ,'st02' ,'3900' ,'8');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i010', 'b10' ,'st02' ,'4500' ,'9');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i011', 'b11' ,'st02' ,'8000' ,'20');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i012', 'b12' ,'st02' ,'8100' ,'18');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i013', 'b13' ,'st02' ,'8250' ,'17');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i014', 'b14' ,'st02' ,'9000' ,'16');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i015', 'b15' ,'st03' ,'10000' ,'21');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i016', 'b16' ,'st03' ,'9900' ,'22');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i017', 'b17' ,'st03' ,'7900' ,'20');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i018', 'b18' ,'st03' ,'8800' ,'15');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i019', 'b19' ,'st03' ,'9150' ,'12');

INSERT INTO inventory( itemID, bikeID, storeID, price, amt_in_stock )
  VALUES('i020', 'b20' ,'st03' ,'11200' ,'22');

-- Orders --
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1001', 'January', 'c001', 'i001', '1', '5000');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1002', 'February', 'c001', 'i004', '2', '10200');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1003', 'March', 'c002', 'i007', '3', '15600');

INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1004', 'April', 'c002', 'i009', '2', '7800');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1005', 'May', 'c003', 'i010', '3', '13500');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1006', 'June', 'c004', 'i018', '1', '9150');

INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1007', 'July', 'c005', 'i015', '1', '10000');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1008', 'August', 'c006', 'i013', '1', '8250');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1009', 'September', 'c007', 'i020', '1', '11200');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1010', 'October', 'c008', 'i020', '2', '22400');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1011', 'November', 'c009', 'i012', '2', '16200');
  
INSERT INTO orders( ordno, month, cid, itemID, quantity, total_price )
  VALUES('1012', 'December', 'c010', 'i013', '3', '24750');

-- Inventory_Orders -- 

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i001', '1001');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i004', '1002');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i007', '1003');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i009', '1004');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i010', '1005');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i018', '1006');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i015', '1007');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i013', '1008');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i020', '1009');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i020', '1010');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i012', '1011');

INSERT INTO inventory_orders( itemID, ordno )
  VALUES('i013', '1012');
  
select * from bikes;