create database sales;
use sales;

#Table Customer
create table customer(customer_id int primary key,customer_name varchar(100),city varchar(100));
insert into customer values(1,"Aditi","Mumbai"),(2,"Rohit","Pune"),(3,"Neha","Delhi"),(4,"Aman","Mumbai"),(5,"Pooja","Bangalore"),
(6,"Rahul","Chennai"),(7,"Sneha","Hyderabad"),(8,"Karan","Delhi"),(9,"Meena","Jaipur"),(10,"Vikram","Mumbai"),(11,"Anita","Pune"),
(12,"Suresh","Chennai"),(13,"Nisha","Bangalore"),(14,"Arjun","Hyderabad"),(15,"Kavya","Delhi"),(16,"Ramesh","Jaipur"),(17,"Isha","Mumbai"),
(18,"Manoj","Pune"),(19,"Divya","Chennai"),(20,"Akash","Bangalore");
select * from customer;

#Table Products
create table products(product_id int primary key,product_name varchar(100),category varchar(50),price int);
insert into products values(101,"Laptop","Electronics",50000),(102,"Mobile","Electronics",20000),(103,"Headphones","Accessories",1500),
(104,"Keyboard","Accessories",1200),(105,"Mouse","Accessories",800),(106,"Tablet","Electronics",30000),(107,"Smartwatch","Electronics",10000),
(108,"Charger","Accessories",1000),(109,"Powerbank","Accessories",2500),(110,"Monitor","Electronics",15000);
select * from products;

#Table Sales
create table sales(sale_id int primary key,customer_id int,product_id int,quantity int,sale_date date,foreign key (customer_id) references customer(customer_id),
foreign key (product_id) references products(product_id));
insert into sales values (1,1,101,1,"2024-01-05"),(2,2,102,2,"2024-01-06"),(3,3,103,3,"2024-01-07"),(4,4,101,1,"2024-01-08"),(5,5,104,2,"2024-01-09"),
(6,1,102,1,"2024-01-10"),(7,6,105,2,"2024-01-11"),(8,7,106,1,"2024-01-12"),(9,8,107,1,"2024-01-13"),(10,9,108,3,"2024-01-14"),
(11,10,109,2,"2024-01-15"),(12,11,110,1,"2024-01-16"),(13,12,102,1,"2024-01-17"),(14,13,103,2,"2024-01-18"),(15,14,104,1,"2024-01-19"),
(16,15,101,1,"2024-01-20"),(17,16,105,3,"2024-01-21"),(18,17,107,1,"2024-01-22"),(19,18,106,2,"2024-01-23"),(20,19,109,1,"2024-01-24"),
(21,20,108,2,"2024-01-25");
select * from sales;

#View Complete Sales Report
create view Sales_Report as select s.sale_id,c.customer_name,p.product_name,p.category,s.quantity,p.price,
(s.quantity*p.price) as total_amount from sales s
join customer c on s.customer_id=c.customer_id
join products p on s.product_id=p.product_id;
select * from Sales_Report;

#Total Revenue by category
select category,sum(s.quantity*p.price) as total_revenue from sales s join products p on s.product_id=p.product_id
group by p.category;

#quantity sold for each product
select p.category ,sum(s.quantity) as total_quantity_sold from sales s
join products p on s.product_id=p.product_id group by p.category;

#best selling product
select p.product_name,sum(s.quantity) as total_sold from sales s
join products p on s.product_id=p.product_id
group by p.product_name order by total_sold desc;

#Sales by city
select c.city, sum(s.quantity*p.price) as city_sales from sales s
join customer c on s.customer_id=c.customer_id
join products p on s.product_id=p.product_id
group by c.city;

select c.city, sum(s.quantity*p.price) as city_revenue from sales s
join customer c on s.customer_id=c.customer_id
join products p on s.product_id=p.product_id
group by c.city
order by city_revenue asc limit 1;











