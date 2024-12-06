create database ecommerce;
create table ecommerce.customers(
	customer_id int primary key auto_increment,
    first_name varchar(30),
    last_name varchar(30),
    email varchar(30) unique,
    phone_no varchar(15),
    shipping_address varchar(100),
    registration_date timestamp default current_timestamp);
insert into ecommerce.customers(customer_id,first_name,last_name,email,phone_no,shipping_address,registration_date) values(null,"Kamali","Ravi","rk2k2@gmail.com","9087654321","12 north street,kumbakonam",not null);
insert into ecommerce.customers(customer_id,first_name,last_name,email,phone_no,shipping_address,registration_date) values(null,"Kavi","Hema","kp2k6@gamil.com","9876543210","15 east street,Trichy",not null);
select * from ecommerce.customers;
insert into ecommerce.customers(first_name,last_name,email,phone_no,shipping_address) values("Sowndharya","Paalpandi","sowndhu99@gmail.com","9942247009","76,Bharathi Nagar,Valparai");
insert into ecommerce.customers(first_name,last_name,email,phone_no,shipping_address) values("Deva dharshini","Devaraj","dd2k1@gmail.com","9384276687","02,solan nagar,coimbatore");
insert into ecommerce.customers(first_name,last_name,email,phone_no,shipping_address) values("Elakkiya","Elagovan","9345965806","ee2k2@gmail.com","34,north street,kumbakonam");
select * from ecommerce.customers;
insert into ecommerce.customers(first_name,last_name,email,phone_no,shipping_address) values("Priya","Gupta","9876543210","pg@gmail.com","45,park st,kolkata,west bengal"),
																							("Kavya","Iyer","6543210987","ki@gmail.com","34 brigade rd,chennai"),
                                                                                            ("Sneha","Reddy","4321098765","sr@gn=mail.com","67 Jublie nagar,Thiruvallur");
select * from ecommerce.customers;
create table ecommerce.categories(
	category_id int primary key auto_increment,
    category_name varchar(30));
insert into ecommerce.categories(category_name) values("Electronics"),
													  ("Kitchen set"),
                                                      ("Beauty care"),
                                                      ("Furniture"),
                                                      ("Clothing"),
                                                      ("Jewels"),
                                                      ("Toys"),
                                                      ("Books");
select * from ecommerce.categories;
create table ecommerce.products(
	product_id int primary key auto_increment,
    product_name varchar(30),
    price decimal(10,2),
    stock_quantity long,
    category_id int,
    foreign key (category_id) references categories(category_id));
insert into ecommerce.products(product_name,price,stock_quantity) values("Airpods",2299.56,50),
																		("Water bottle",699.09,80),
                                                                        ("Lipstick",399.13,50),
                                                                        ("Remote control car",1200,15),
                                                                        ("Puzzle cube",299,100),
                                                                        ("Floral crop top",399,50),
                                                                        ("Pearl stud",199,67),
                                                                        ("Coffee table",3499,30);
select * from ecommerce.products;
insert into ecommerce.products(category_id) values(1),(2),(3),(4),(5),(6),(7),(8);
select * from ecommerce.products;
truncate table ecommerce.products;
select * from ecommerce.products;
insert into ecommerce.products(product_name,price,stock_quantity) values("Airpods",2299.56,50),
																		("Water bottle",699.09,80),
                                                                        ("Lipstick",399.13,50),
                                                                        ("Remote control car",1200,15),
                                                                        ("Puzzle cube",299,100),
                                                                        ("Floral crop top",399,50),
                                                                        ("Pearl stud",199,67),
                                                                        ("Coffee table",3499,30);
truncate table ecommerce.products;
select * from ecommerce.products;
insert into ecommerce.products(product_name,price,stock_quantity,category_id) values("Airpods",2299.56,50,1),
																		("Water bottle",699.09,80,2),
                                                                        ("Lipstick",399.13,50,3),
                                                                        ("Remote control car",1200,15,4),
                                                                        ("Puzzle cube",299,100,5),
                                                                        ("Floral crop top",399,50,6),
                                                                        ("Pearl stud",199,67,7),
                                                                        ("Coffee table",3499,30,8);
 select * from ecommerce.products;
 create table ecommerce.orders(
	order_id int primary key auto_increment,
    customer_id int,
    order_date timestamp default current_timestamp,
    order_status varchar(30),
    total_amount decimal(10,2),
    shipping_address varchar(50),
    foreign key (customer_id) references customers(customer_id));
    insert into ecommerce.orders(order_status,total_amount,shipping_address)values("Processing",2299.56,"12,north street kumbakonam"),
																							  ("Shipped",699.09,"15 east street,Trichy"),
                                                                                              ("On hold",399.19,"76 Bharathi nagar,Valparai"),
                                                                                              ("Payment pending",1200,"02 solan nagar,coimbatore"),
                                                                                              ("Cancelled",299,"34 north street,kumbakonam"),
                                                                                              ("Delivered",399,"45 park st,kolkata,west bengal"),
                                                                                              ("Out of deliver",199,"34 brigade rd,chennai"),
                                                                                              ("Shipped",3499,"67 Jublie nagar,Thiruvallur");
select * from ecommerce.orders;
create table ecommerce.order_items(
		order_item_id int primary key auto_increment,
        order_id int,
        product_id int,
        quantity int,
        foreign key (order_id) references orders(order_id),
        foreign key (product_id) references products(product_id));
insert into ecommerce.order_items(quantity) values(50),(80),(50),(15),(100),(50),(67),(30);
select * from ecommerce.order_items;
create table ecommerce.payments(
		payment_id int primary key auto_increment,
        order_id int,
        payment_date timestamp default current_timestamp,
        payment_amount decimal(10,2),
        payment_method varchar(50),
        payment_status varchar(50),
        foreign key(order_id) references orders(order_id));
insert into ecommerce.payments(payment_amount,payment_method,payment_status) values(2299.56,"COD","completed"),
																				   (699.09,"Digital wallet","completed"),
                                                                                   (399.19,"COD","completed"),
                                                                                   (1200,"credit card","pending"),
                                                                                   (299,"Debit card","failed"),
                                                                                   (399,"COD","completed"),
                                                                                   (199,"credit card","completed"),
                                                                                   (3499,"Debit card","completed");
select * from ecommerce.payments;
create table ecommerce.reviews(
	review_id int primary key auto_increment,
    customer_id int,
    product_id int,
    rating int,
    foreign key(customer_id) references customers(customer_id),
    foreign key(product_id) references products(product_id));
drop table ecommerce.reviews;
create table ecommerce.reviews(
	review_id int primary key auto_increment,
    customer_id int,
    product_id int,
    rating float,
    foreign key(customer_id) references customers(customer_id),
    foreign key(product_id) references products(product_id));
insert into ecommerce.reviews(rating) values(4.2),(4.9),(3.9),(3.7),(4.5),(4.1),(3.2),(4.0);
select * from ecommerce.reviews;
select product_name,price from products where category_id = (select category_id from categories where category_name = "Electronics");
select o.order_id,o.order_date,o.order_status,o.total_amount from orders o where o.customer_id = 1;


                                                      
