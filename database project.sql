CREATE schema restaurantschema;
CREATE TABLE restaurantschema.staff (
	staffid char(4) NOT NULL,
	"name" varchar(15) NOT NULL,
	"role" varchar(15) NULL,
	contact_information varchar(30) NOT NULL, 
	CONSTRAINT staffpk PRIMARY KEY (staffid),
	CONSTRAINT staffunique UNIQUE (contact_information)
);

CREATE TABLE restaurantschema.table (
	tableid int NOT NULL,
	uniqueidentifier varchar(20) NULL,
	capacity int NULL,
	CONSTRAINT table_pkey PRIMARY KEY (tableid)
);

CREATE TABLE restaurantschema.shift (
	shiftid int NOT NULL,
	starttime time NULL,
	endtime time NULL,
	CONSTRAINT shift_pkey PRIMARY KEY (shiftid)
);

CREATE TABLE restaurantschema.menu_category (
	id char(5) NOT NULL,
	"name" varchar(10) NOT NULL,
	CONSTRAINT menu_category_pkey PRIMARY KEY (id)
);

CREATE TABLE restaurantschema.ingredients (
	"name" varchar(15) NOT NULL,
	code serial NOT NULL,
	number_of_stock int NULL,
	sort char(10) NOT NULL,
	CONSTRAINT ingredients_pkey PRIMARY KEY (code)
);

CREATE TABLE restaurantschema.menuitem (
	menuitemid int NOT NULL,
	"name" varchar(50) NULL,
	description varchar(255) NULL,
	code varchar(20) NULL,
	price serial not NULL,
	CONSTRAINT menuitem_pkey PRIMARY KEY (menuitemid)
);

CREATE TABLE restaurantschema.customer (
	"name" varchar(15) NOT NULL,
	id char(11) NOT NULL,
	contact_info int NOT NULL,
	reservation_no int NULL,
	CONSTRAINT customer_pkey PRIMARY KEY (id),
	CONSTRAINT customerunique UNIQUE (name, contact_info, reservation_no)
);

CREATE TABLE restaurantschema.reservation (
    reservationid int NOT NULL,
    
   "time" time NULL,
   "date" date NULL,
    numberofguests int NULL,
    tableid int NOT NULL, 
    CONSTRAINT reservation_pkey PRIMARY KEY (reservationid)
   
   );

CREATE TABLE restaurantschema.waiter (
    staffid char(4) NOT NULL,
    serviceskillrating int NULL,
    CONSTRAINT waiter_pkey PRIMARY KEY (staffid),
    CONSTRAINT waiter_staff_fk FOREIGN KEY (staffid) REFERENCES restaurantschema.staff (staffid));

CREATE TABLE restaurantschema.chef (
    staffid char(4) NOT NULL,
    culinaryexpertise varchar(100) NULL,
    specialization varchar(100) NULL,
	"name" varchar(15) NOT NULL,
    CONSTRAINT chef_staff_pkey PRIMARY KEY (staffid),
    CONSTRAINT chef_staff_fk FOREIGN KEY (staffid) REFERENCES restaurantschema.staff (staffid)
);

INSERT INTO restaurantschema.ingredients
(name, code, number_of_stock, sort)
VALUES
('tomato', '627328', 1393021, 'vegetable');
INSERT INTO restaurantschema.ingredients
(name, code, number_of_stock, sort)
VALUES
('apple', '763892', 73239823, 'fruit');
INSERT INTO restaurantschema.ingredients
(name, code, number_of_stock, sort)
VALUES
('Chicken', '2832892', 6231823, 'meat');
INSERT INTO restaurantschema.ingredients
(name, code, number_of_stock, sort)
VALUES
('milk', '502892', 128323, 'Liquit');
INSERT INTO restaurantschema.ingredients
(name, code, number_of_stock, sort)
VALUES
('Banana', '763912', 93273, 'fruit');






INSERT INTO restaurantschema.menu_category (id, "name")
VALUES
('001', 'Appetizer'),
('002', 'Main'),
('003', 'Dessert'),
('004', 'Beverage');
INSERT INTO restaurantschema.menuitem (menuitemid, "name", description, code, price)
VALUES
(1, 'Spaghetti Carbonara', 'Pasta with eggs, cheese, bacon, and black pepper', 'SPG-CARB', 12.99),
(2, 'Grilled Salmon', 'Freshly grilled salmon served with vegetables', 'GR-SLMN', 16.50),
(3, 'Chocolate Cake', 'Decadent chocolate cake with a rich ganache', 'CHOC-CAKE', 8.75),
(4, 'Iced Tea', 'Refreshing iced tea', 'ICD-TEA', 2.50),
(5, 'Caesar Salad', 'Classic Caesar salad with dressing and croutons', 'CSAR-SLD', 9.25);

INSERT INTO restaurantschema.reservation (reservationid,  "time", "date", numberofguests, tableid)
VALUES
(1,  '18:00:00', '2023-12-24', 4, 1),
(2,  '19:30:00', '2023-12-25', 6, 2),
(3,  '20:00:00', '2023-12-28', 3, 3),
(4,  '18:30:00', '2023-12-30', 5, 4),
(5,  '19:00:00', '2024-01-02', 2, 5);
INSERT INTO restaurantschema.customer ("name", id, contact_info, reservation_no)
VALUES
('John Doe', '12345678901', 123456789, 1001),
('Alice Smith', '23456789012', 987654321, NULL),
('Bob Johnson', '34567890123', 555555555, 1002),
('Emma Davis', '45678901234', 777777777, 1003),
('Michael Brown', '56789012345', 888888888, NULL);
INSERT INTO restaurantschema.shift (shiftid, starttime, endtime)
VALUES
(1, '08:00:00', '16:00:00'),
(2, '12:00:00', '20:00:00'),
(3, '16:00:00', '00:00:00'),
(4, '20:00:00', '04:00:00');
INSERT INTO restaurantschema.staff (staffid, "name", "role", contact_information)
VALUES
('S001', 'John', 'Chef', 'john@example.com'),
('S002', 'Alice', 'Waiter', 'alice@example.com'),
('S003', 'Bob', 'Bartender', 'bob@example.com'),
('S004', 'Emma', 'Chef', 'emma@example.com'),
('S005', 'Michael', 'Manager', 'michael@example.com'),
('S006', 'Halit', 'Waiter', 'halit@example.com'),
('S007', 'Black', 'Waiter', 'balck@example.com');


INSERT INTO restaurantschema."table" (tableid, uniqueidentifier, capacity)
VALUES
(1, 'TBL001', 4),
(2, 'TBL002', 6),
(3, 'TBL003', 2),
(4, 'TBL004', 8),
(5, 'TBL005', 5);

INSERT INTO restaurantschema.waiter (staffid, serviceskillrating)
VALUES
('S002', 4),
('S006', 5),
('S007', 3);

INSERT INTO restaurantschema.chef (staffid, culinaryexpertise, specialization,"name")
VALUES
('S001','French Cuisine', 'Pastry', 'Jhon'),
('S004', 'Asian Cuisine', 'Sushi', 'Emma');





CREATE TABLE restaurantschema.menuitem_ingredient (
    menuitemid int NOT NULL,
    code serial NOT NULL,
    CONSTRAINT menuitem_ingredient_pk PRIMARY KEY (menuitemid, code),
    CONSTRAINT menuitem_fk FOREIGN KEY (menuitemid) REFERENCES restaurantschema.menuitem (menuitemid),
    CONSTRAINT ingredient_fk FOREIGN KEY (code) REFERENCES restaurantschema.ingredients (code)
);

CREATE TABLE restaurantschema.staff_shift (
    staffid char(4) NOT NULL,
    shiftid int NOT NULL,
    CONSTRAINT staff_shift_pk PRIMARY KEY (staffid, shiftid),
    CONSTRAINT staff_shift_staff_fk FOREIGN KEY (staffid) REFERENCES restaurantschema.staff (staffid),
    CONSTRAINT staff_shift_shift_fk FOREIGN KEY (shiftid) REFERENCES restaurantschema.shift (shiftid)
);

CREATE TABLE restaurantschema.chef_menuitem (
    staffid char(4) NOT NULL,
    menuitemid int NOT NULL,
    CONSTRAINT chef_menuitem_pk PRIMARY KEY (staffid, menuitemid),
    CONSTRAINT chef_menuitem_chef_fk FOREIGN KEY (staffid) REFERENCES restaurantschema.chef (staffid),
    CONSTRAINT chef_menuitem_menuitem_fk FOREIGN KEY (menuitemid) REFERENCES restaurantschema.menuitem (menuitemid)
);
I
ALTER TABLE restaurantschema.menuitem ADD COLUMN category_id char(5)  NULL;
ALTER TABLE restaurantschema.menuitem ADD CONSTRAINT menuitem_category_fk FOREIGN KEY (category_id) REFERENCES restaurantschema.menu_category (id);

CREATE TABLE restaurantschema.customer_menuitem (
    customer_id char(11) NOT NULL,
    menuitem_id int NOT NULL,
    CONSTRAINT customer_menuitem_pk PRIMARY KEY (customer_id, menuitem_id),
    CONSTRAINT customer_menuitem_customer_fk FOREIGN KEY (customer_id) REFERENCES restaurantschema.customer (id),
  CONSTRAINT customer_menuitem_menuitem_fk FOREIGN KEY (menuitem_id) REFERENCES restaurantschema.menuitem (menuitemid)
);



 
ALTER TABLE restaurantschema.reservation ADD CONSTRAINT reservation_table_fk FOREIGN key (tableid) REFERENCES "restaurantschema"."table" (tableid);
Alter table restaurantschema.customer add COLUMN staffid char(4);
ALTER TABLE restaurantschema.customer ADD CONSTRAINT customer_waiter_fk FOREIGN key (staffid) REFERENCES restaurantschema.waiter (staffid);

Alter table restaurantschema.reservation  add COLUMN id char(11);
ALTER TABLE restaurantschema.reservation ADD CONSTRAINT customer_reservation_fk FOREIGN key (id) REFERENCES restaurantschema.customer (id);

--INNER JOIN ISLEMI 
SELECT shift.shiftid, 
       shift.starttime,
       shift.endtime,
       staff.staffid,
       staff.name,
       staff.role
       from restaurantschema. staff_shift
       INNER JoIN restaurantschema.shift
       On shift.shiftid = staff_shift.shiftid
       Inner Join restaurantschema.staff
       On staff_shift.staffid = staff.staffid;
INSERT INTO "restaurantschema"."customer_menuitem" ( "customer_id", "menuitem_id") 
VALUES ( 12345678901, 2 ), (23456789012, 1);

INSERT INTO "restaurantschema"."menuitem_ingredient" (  menuitemid, code) 
VALUES ( 1,627328 ), ( 2, 2832892);




--Functions:
--funtion for selectting shifts
CREATE OR REPLACE FUNCTION restaurantschema.get_shift(p_shiftid INT)
RETURNS TABLE (
    shiftid INT,
    starttime TIME,
    endtime TIME
)
AS $$
BEGIN
    RETURN QUERY SELECT restaurantschema.shift.shiftid, restaurantschema.shift.starttime, restaurantschema.shift.endtime FROM restaurantschema.shift WHERE restaurantschema.shift.shiftid = p_shiftid;
END;
$$ LANGUAGE plpgsql;
--get_shifts fonksiyonunu çağırma
SELECT * from restaurantschema. get_shift(2);

--SELECT * FROM pg_proc WHERE proname = 'get_shifts';

--get customer information
CREATE OR REPLACE FUNCTION restaurantschema.get_all_customers()
RETURNS TABLE (
    customer_name VARCHAR(15),
    customer_id CHAR(11),
    contact_info INT,
    reservation_no INT
)
AS $$
BEGIN
    RETURN QUERY SELECT restaurantschema.customer.name,restaurantschema.customer.id,restaurantschema.customer.contact_info,restaurantschema.customer.reservation_no 
    FROM restaurantschema.customer;
END;
$$ LANGUAGE plpgsql;
SELECT * from restaurantschema. get_all_customers();


--list menü_item accrding to chef
CREATE OR REPLACE FUNCTION restaurantschema.get_menuitems_by_chef_specialization(p_chef_id BPCHAR(4))
RETURNS TABLE (
    menuitem_name VARCHAR(50),
    menuitem_description VARCHAR(255),
    menuitem_code VARCHAR(20),
    menuitem_price INT
)
AS $$
BEGIN
    RETURN QUERY
        SELECT restaurantschema.menuitem."name", restaurantschema.menuitem.description, restaurantschema.menuitem.code, restaurantschema.menuitem.price
        FROM restaurantschema.menuitem 
        JOIN restaurantschema.chef_menuitem ON restaurantschema.menuitem.menuitemid = restaurantschema.chef_menuitem.menuitemid
        WHERE restaurantschema.chef_menuitem.staffid = p_chef_id;
END;
$$ LANGUAGE plpgsql;
SELECT * from restaurantschema.get_menuitems_by_chef_specialization('S001');
SELECT * from restaurantschema.get_menuitems_by_chef_specialization('S004');

--SELECT * FROM restaurantschema.chef_menuitem;



--select toplam(1,2);


Create OR REPLACE FUNCTION restaurantschema.kdv_menu_ucret(fiyat FLOAT )
returns FLOAT
as 
$$
BEGIN
    fiyat = fiyat *0.08 + fiyat;
    return fiyat;
END; 
$$
language plpgsql;
select "name",description,price,restaurantschema. kdv_menu_ucret(price) FROM restaurantschema.menuitem;


Create or Replace FUNCTION restaurantschema.zam_yap()
   RETURNS TRIGGER
   AS
   $$
   BEGIN
        update restaurantschema.menuitem set price = price + 2;
        return new;
   END;
   $$ LANGUAGE plpgsql;
   
select "name",description,price, restaurantschema.kdv_menu_ucret(price) from restaurantschema. menuitem;
alter table restaurantschema.menuitem add constraint pricecheck check (length(description) >= 10);
create index ingredientsindex on restaurantschema.ingredients (code);
  

--Trigger 1:
create OR Replace TRIGGER zam_yap_trigger
after INSERT 
on restaurantschema. menuitem 
for each row
EXECUTE FUNCTION restaurantschema.zam_yap();
--after insertion trigger will be triggered and then values in the the menuitem table will be goes up 
Insert into restaurantschema. menuitem (menuitemid,"name", price) VALUES (7,'Spaghetti with Alfredo Souce', 12);
select "name",description,price, restaurantschema.kdv_menu_ucret(price) FROM restaurantschema.menuitem;


 


--trigger 2:


CREATE OR REPLACE FUNCTION restaurantschema.change_serviceskillrating()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.serviceskillrating> NEW.serviceskillrating THEN
        UPDATE restaurantschema.waiter
        SET serviceskillrating = NEW.serviceskillrating
        WHERE staffid = OLD.staffid;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;




CREATE TRIGGER update_rate_trigger
BEFORE UPDATE ON restaurantschema.waiter
FOR EACH ROW
WHEN (OLD.serviceskillrating > NEW.serviceskillrating)
EXECUTE FUNCTION restaurantschema.change_serviceskillrating();
UPDATE restaurantschema.waiter SET serviceskillrating = 2 WHERE staffid = 'S002';  
SELECT * from restaurantschema.waiter;

-- Trigger 2

CREATE OR REPLACE FUNCTION restaurantschema.mergeStaffWithWaiter()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM restaurantschema.waiter WHERE staffid = NEW.staffid) THEN
     
        RETURN NEW;
    ELSE
        
        INSERT INTO restaurantschema.waiter (staffid) VALUES (NEW.staffid);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


--Trigger3:

CREATE TRIGGER merge_staff_with_waiter_trigger
AFTER INSERT ON restaurantschema.staff
FOR EACH ROW
EXECUTE FUNCTION restaurantschema.mergeStaffWithWaiter();

INSERT INTO restaurantschema.staff (staffid, "name", "role", contact_information)
VALUES ('S011', 'Selena', 'Waiter', 'selena@example.com');

select *from restaurantschema.waiter;

--Trigger 4:

--adding staff to the staff table also manipulates cheff tbale
CREATE OR REPLACE FUNCTION restaurantschema.mergeStaffWithChef()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM restaurantschema.chef WHERE staffid = NEW.staffid) THEN
        RETURN NEW;
    ELSE
        INSERT INTO restaurantschema.chef (staffid, "name") VALUES (NEW.staffid, NEW."name");
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER merge_staff_with_chef_trigger
AFTER INSERT ON restaurantschema.staff
FOR EACH ROW
WHEN (NEW."role" = 'Chef')
EXECUTE FUNCTION restaurantschema.mergeStaffWithChef();


INSERT INTO restaurantschema.staff (staffid, "name", "role", contact_information)
VALUES ('S021', 'Charles', 'Chef', 'charles@example.com');


INSERT INTO restaurantschema.staff (staffid, "name", "role", contact_information)
VALUES ('S023', 'marine', 'waiter', 'marine@example.com');

CREATE OR REPLACE FUNCTION restaurantschema.mergeStaffWithWaiter()
RETURNS TRIGGER AS $$
BEGIN
     IF NEW."role" = 'Waiter' THEN
        INSERT INTO restaurantschema.waiter (staffid) VALUES (NEW.staffid);
    
     ELSIF NEW."role" = 'Chef' THEN
         INSERT INTO restaurantschema.chef (staffid,name) VALUES (NEW.staffid, new.name);
        
  
    END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER merge_staff_with_waiter_trigger
AFTER INSERT ON restaurantschema.staff
FOR EACH ROW
EXECUTE FUNCTION restaurantschema.mergeStaffWithWaiter();

INSERT INTO restaurantschema.staff (staffid, "name", "role", contact_information)
VALUES ('S025', 'HANNAH', 'waiter', 'hannah@example.com');



--Trigger 5: for if waiter is late there will be more minutes he/she has to work for

CREATE OR REPLACE function restaurantschema. calculate_shift_endtime()
RETURNS TRIGGER AS $$
DECLARE
    late_minutes INT;
    extra_time INTERVAL;
BEGIN
    
    late_minutes := EXTRACT(EPOCH FROM (NEW.starttime - OLD.starttime)) / 60;

    
    IF late_minutes > 15 THEN
        
        extra_time := (late_minutes * interval '1 minute') * 2;

        
        NEW.endtime := NEW.endtime + extra_time;
    ELSE
        
        NEW.endtime := OLD.endtime;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create or REPLACE trigger endtime_trigger
BEFORE UPDATE OF starttime ON restaurantschema.shift
FOR EACH ROW
EXECUTE FUNCTION restaurantschema.calculate_shift_endtime();


UPDATE restaurantschema.shift
SET starttime = ' 12:20:00' 
WHERE shiftid = 2;
