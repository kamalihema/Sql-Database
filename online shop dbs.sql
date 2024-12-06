create database purpelle;

create table purpelle.profile(
FullName varchar(255) NOT NULL,
Email varchar(255) UNIQUE,
MobileNumber  long NOT NULL,
Location varchar(255) NOT NULL);

insert into purpelle.profile values("Shalini","ss2003@gmail.com",9384276642,"Trichy");

create table purpelle.product(
productid int primary key,
Productname varchar(255),
Brandname varchar(255),
price varchar(255),
Quantity varchar(255),
Ratings varchar(255));



insert into purpelle.product values(1106,"False Eyelashes","Swiss Beauty","₹252","High volume02",4.1);


create table purpelle.orderdtls(
Orderid int NOT NULL,
Productid int,
Productname varchar(255),
Address varchar(255) not null,
Addresstype varchar(255),
Payment varchar(255),
Orderdate date,
Deliverydate date,
primary key(Productid),
foreign key(productid)
references product(productid));

insert into purpelle.orderdtls(orderid,productid,productname,address,addresstype,payment,orderdate,deliverydate)
values(1907,1981,"False Eyelashes","T Nagar","other","cash on delivery",'2023-09-25','2023-10-04');

select purpelle.product.Productname,purpelle.orderdtls.Orderdate,purpelle.orderdtls.Deliverydate,purpelle.product.price,purpelle.orderdtls.Payment
from purpelle.orderdtls join purpelle.product on purpelle.orderdtls.Productid=purpelle.product.productid;

update purpelle.orderdtls set Productname="Setting spray" where orderid=1903;
