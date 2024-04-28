-- dbs project live auction
create database auction;
use auction;
-- show tables;
-- describe bids;
-- select * from users;
-- select * from items;
-- delete from users;
-- drop table items;
-- drop database auction;
-- show databases;
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  pwd VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_admin ENUM('yes','no') default 'no'
);

CREATE TABLE items (
  item_id INT PRIMARY KEY AUTO_INCREMENT,
  item_name VARCHAR(50) NOT NULL,
  item_desription TEXT NOT NULL,
  start_bid DECIMAL(10,2) NOT NULL,
  reserve_price DECIMAL(10,2) NOT NULL,
  end_time TIMESTAMP NOT NULL
  -- item_status ENUM('open', 'closed') DEFAULT 'open'
);

CREATE TABLE bids (
  bid_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  item_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  bid_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (item_id) REFERENCES items(item_id),
  bid_status ENUM('current', 'outbid','sold')
);
-- show tables;
create view administrator as
select bids.user_id, username, email, registration_date, bids.item_id, item_name, item_desription, start_bid, reserve_price, end_time, bid_id, amount, bid_time, bid_status
from users
join bids
on users.user_id = bids.user_id
join items
on items.item_id=bids.item_id;

create view view_user_1 as
select bids.user_id, username, email, registration_date, bids.item_id, item_name, item_desription, start_bid, reserve_price, end_time, bid_id, amount, bid_time, bid_status
from users
join bids
on users.user_id = bids.user_id
join items
on items.item_id=bids.item_id
where bids.user_id=1;


-- ADDING VALUES INTO USERS
INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('1', 'Nikhil Biyani', 'Nikhil@Biyani1', 'nikhilbiyani@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('2', 'Mitul Chadha', 'Mitul@Chadha2', 'mitulchadha@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('3', 'Shiv Shukla', 'Shiv@Shukla3', 'shivshukla@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('4', 'Bhavya Kalyani', 'Bhavya@Kalyani4', 'bhavyakalyani@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('5', 'Pratham Oza', 'Pratham@Oza5', 'prathamoza@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('6', 'Mayank Parnandiwar', 'Mayank@Parnandiwar6', 'mayankparnandiwar@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('7', 'Siddharth Mehrotra', 'Siddharth@Mehrotra7', 'siddharthmehrotra@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('8', 'Arnav Singh', 'Arnav@Singh8', 'arnavsingh@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('9', 'Dhruv Iyengar', 'Dhruv@Iyengar9', 'dhruviyengar@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('10', 'Prasast Singh', 'Prasast@Singh10', 'prasastsingh@gmail.com', Current_timestamp);

INSERT INTO users (user_id, username, pwd, email, registration_date)
VALUES ('11', 'Mukund Mishra', 'Mukund@Mishra11', 'mukundmishra@gmail.com', Current_timestamp);



-- ADDING VALUES TO ITEMS

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(1, 'football', 'A premium size 5 football.', 400, '2023-04-11 23:59:59',200);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(2, 'cricket bat', 'A premium English willlow bat.', 700, '2023-04-11 23:59:59',300);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(3, 'chair', 'A comfortable chair for office work.', 1200, '2023-04-11 23:59:59',600);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(4, 'powerbank', 'A 12,000 mAH powerbank.', 3100, '2023-04-11 23:59:59',1000);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(5, 'mobile charger', 'A fast C type charger with a chord of length 1m.', 1500, '2023-04-11 23:59:59',1200);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(6, 'suitcase', 'Lightweight suitcase for travelling.', 6000, '2023-04-11 23:59:59',3000);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(7, 'bottle', 'A bottle made of stainless steel with a capacity of 1.5L.', 550, '2023-04-11 23:59:59',300);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(8, 'whiteboard', 'New whiteboard for teaching purpose. Size 40 inches * 25 inches.', 1800, '2023-04-11 23:59:59',1200);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(9, 'Book', 'Latest edition book of Database Systems by Jeffrey Ullman, and Jennifer Widom.', 700, '2023-04-11 23:59:59',400);

insert into items (item_id, item_name, item_desription, start_bid, end_time,reserve_price)
values(10, 'Poster', 'Poster of the greatest football player of all time', 50, '2023-04-11 23:59:59',25);

-- INSERTING BIDS


update bids
set bid_status='outbid'
where item_id='2' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status,bid_time) VALUES (1, 2, 10000.00,'current',now());
-- select * from bids;

update bids
set bid_status='outbid'
where item_id='2' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (1, 2, 15000.00,'current');

update bids
set bid_status='outbid'
where item_id='2' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (4, 2, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='4' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (4, 4, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='3' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (4, 3, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='4' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (6, 4, 16200.00,'current');

update bids
set bid_status='outbid'
where item_id='7' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (1, 7, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='8' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (2, 8, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='5' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (2, 5, 16000.00,'current');

update bids
set bid_status='outbid'
where item_id='7' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (2, 7, 16020.00,'current');

select * from users;
select * from items;
select * from bids;

-- query to insert into the "users" table
INSERT INTO users (username, pwd, email)
VALUES ('john_doe', 'mypassword', 'john.doe@email.com');
-- if we want to add an admin, we will change the parametres and add a yes to the is_admin status
--
-- query to insert into "items" table
INSERT INTO items (name, description, start_bid, reserve_price, end_time)
VALUES ('Antique vase', 'A beautiful porcelain vase from the 18th century', 100.00, 200.00, '2023-04-30 23:59:59');
--
-- query to get the maximum bid for a particular item
SELECT MAX(amount) FROM bids WHERE item_id = 2;       -- item_id will be given for the specific item
--
-- query to get the number of bids for a particular item
SELECT count(*) from bids where item_id=2;
--
-- query to view the items available during the auction
select item_name from items where NOW()<end_time;		-- 
--
-- query to give the highest bidder of a particular item
select * from users where user_id=(select user_id from bids where item_id=2 and bid_status='current');
--
-- query to get the number of users that have placed bids on a specific item
SELECT count(distinct user_id) from bids where item_id=2;
--
-- query to add the prices of all the bids that have been placed on a specific item so far
select sum(amount) from bids where item_id=2;
--
-- query to give the status of a given bid
select bid_status from bids where bid_id=1;
--
-- query to give the total number of items a specific user has bid on in the current auction
select count(distinct item_id) from bids where user_id=1;
--
-- query to give the total amount of all the bids placed by a specific user in the current auction
select sum(amount) from bids where user_id=1;
--

-- query to insert a new bid for an item
update bids
set bid_status='outbid'
where item_id='1' and bid_status='current';
INSERT INTO bids (user_id, item_id, amount,bid_status) VALUES (1, 1, 150.00,'current');
--
-- query to update the status of a bid to closed after the auction has ended
UPDATE bids
SET bid_status = 'sold' 
WHERE NOW()>(select end_time from items where item_id=1) and item_id=1;
--
-- query to get the bidding history for a particular user.
select user_id, item_id,amount,bid_time,bid_status
from bids
where user_id=1
order by bid_time desc;
--
-- select * from users;
-- select * from items;
-- select * from bids;

