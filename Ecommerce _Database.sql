CREATE DATABASE ecom;

USE ecom;

/*DROP TABLE customer;*/
/*Store customer information*/
CREATE TABLE customer(

   cust_id INT PRIMARY KEY,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(20) NOT NULL,
   email VARCHAR(70) NOT NULL UNIQUE,
   phno VARCHAR(15) NOT NULL UNIQUE,
   city VARCHAR(30) NOT NULL,
   regi_date DATE NOT NULL

);


/*DROP TABLE categories;*/
/*Organize products*/
CREATE TABLE categories(

   cate_id INT PRIMARY KEY AUTO_INCREMENT,
   cate_name VARCHAR(30) NOT NULL UNIQUE,
   des VARCHAR(100)

);


/*DROP TABLE products;*/
/*Maintain product information*/
CREATE TABLE products(

  pro_id INT PRIMARY KEY AUTO_INCREMENT,
  pro_name VARCHAR(40) NOT NULL,
  cate_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK(price > 0),
  stock_quantity INT NOT NULL CHECK(stock_quantity >= 0),
  brand VARCHAR(20) NOT NULL,
  FOREIGN KEY(cate_id) REFERENCES categories(cate_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE

);


/*DROP TABLE orders ;*/
/*Track customer purchases*/
CREATE TABLE orders(

  order_id INT PRIMARY KEY AUTO_INCREMENT,
  cust_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL CHECK(total_amount>=0),
  order_status VARCHAR(20) NOT NULL CHECK(order_status IN('Pending','Shipped','Delivered','Cancelled')),
  FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


/*DROP TABLE order_items ;*/
/*Store individual products inside an order*/
CREATE TABLE order_items(

   order_item_id INT PRIMARY KEY AUTO_INCREMENT,
   order_id INT NOT NULL,
   pro_id INT NOT NULL,
   quantity INT NOT NULL CHECK(quantity>0),
   unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price>=0),
   FOREIGN KEY(order_id) REFERENCES orders(order_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id)
   ON DELETE CASCADE
   ON UPDATE CASCADE
);


/*DROP TABLE payments;*/
/*Payment Management*/
CREATE TABLE payments(

    pay_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    pay_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK(amount>=0),
    pay_method VARCHAR(20) NOT NULL, CHECK (pay_method IN ('UPI','Credit Card','Debit Card','Net Banking','Cash on Delivery')),
    pay_status VARCHAR(20) NOT NULL, CHECK (pay_status IN ('Pending','Completed','Failed','Refunded')),

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO customer
(cust_id, first_name, last_name, email, phno, city, regi_date)
VALUES
(1,'Rahul','Sharma','rahul.sharma@gmail.com','9876543210','Hyderabad','2017-10-02'),
(2,'Priya','Reddy','priya.reddy@gmail.com','9123456781','Bengaluru','2017-10-15'),
(3,'Arjun','Patel','arjun.patel@gmail.com','9988776652','Ahmedabad','2017-11-01'),
(4,'Sneha','Nair','sneha.nair@gmail.com','9012345673','Kochi','2017-11-20'),
(5,'Vikram','Singh','vikram.singh@gmail.com','9345678904','Delhi','2017-12-05'),
(6,'Ananya','Gupta','ananya.gupta@gmail.com','9876501235','Mumbai','2017-12-18'),
(7,'Rohit','Verma','rohit.verma@gmail.com','9765432106','Pune','2018-01-03'),
(8,'Pooja','Joshi','pooja.joshi@gmail.com','9654321097','Jaipur','2018-01-17'),
(9,'Karan','Mehta','karan.mehta@gmail.com','9543210988','Surat','2018-02-01'),
(10,'Neha','Yadav','neha.yadav@gmail.com','9432109879','Lucknow','2018-02-14'),
(11,'Amit','Kumar','amit.kumar@gmail.com','9321098760','Chennai','2018-02-28'),
(12,'Divya','Iyer','divya.iyer@gmail.com','9210987651','Coimbatore','2018-03-12'),
(13,'Sandeep','Rao','sandeep.rao@gmail.com','9109876542','Visakhapatnam','2018-03-25'),
(14,'Meera','Das','meera.das@gmail.com','9098765433','Kolkata','2018-04-06'),
(15,'Nikhil','Mishra','nikhil.mishra@gmail.com','9987654324','Bhopal','2018-04-20'),
(16,'Kavya','Kulkarni','kavya.kulkarni@gmail.com','9876541235','Nagpur','2018-05-03'),
(17,'Harish','Jain','harish.jain@gmail.com','9765412346','Indore','2018-05-18'),
(18,'Aishwarya','Banerjee','aishwarya.banerjee@gmail.com','9654321457','Chandigarh','2018-06-01'),
(19,'Manoj','Choudhary','manoj.choudhary@gmail.com','9543214568','Mysuru','2018-06-15'),
(20,'Ritika','Agarwal','ritika.agarwal@gmail.com','9432145679','Noida','2018-07-01'),
(21,'Abhishek','Pandey','abhishek.pandey@gmail.com','9321456780','Patna','2018-07-14'),
(22,'Shreya','Saxena','shreya.saxena@gmail.com','9214567891','Bhubaneswar','2018-07-28'),
(23,'Deepak','Tripathi','deepak.tripathi@gmail.com','9105678902','Vijayawada','2018-08-10'),
(24,'Nandini','Menon','nandini.menon@gmail.com','9096789013','Thiruvananthapuram','2018-08-24'),
(25,'Akash','Bansal','akash.bansal@gmail.com','9987890124','Gurugram','2018-09-05');

INSERT INTO customer
(cust_id, first_name, last_name, email, phno, city, regi_date)
VALUES
(26,'Ankit','Malhotra','ankit.malhotra@gmail.com','9876543225','Amritsar','2018-09-12'),
(27,'Swati','Shukla','swati.shukla@gmail.com','9876543226','Kanpur','2018-09-20'),
(28,'Rakesh','Tiwari','rakesh.tiwari@gmail.com','9876543227','Varanasi','2018-10-01'),
(29,'Komal','Arora','komal.arora@gmail.com','9876543228','Ludhiana','2018-10-08'),
(30,'Sachin','Chauhan','sachin.chauhan@gmail.com','9876543229','Dehradun','2018-10-15'),
(31,'Preeti','Bhardwaj','preeti.bhardwaj@gmail.com','9876543230','Faridabad','2018-10-22'),
(32,'Varun','Khanna','varun.khanna@gmail.com','9876543231','Ghaziabad','2018-10-30'),
(33,'Ishita','Sinha','ishita.sinha@gmail.com','9876543232','Ranchi','2018-11-05'),
(34,'Mohit','Bajaj','mohit.bajaj@gmail.com','9876543233','Jodhpur','2018-11-12'),
(35,'Tanvi','Kapoor','tanvi.kapoor@gmail.com','9876543234','Udaipur','2018-11-18'),
(36,'Saurabh','Pillai','saurabh.pillai@gmail.com','9876543235','Kozhikode','2018-11-24'),
(37,'Ritu','Bose','ritu.bose@gmail.com','9876543236','Siliguri','2018-12-01'),
(38,'Gaurav','Mahajan','gaurav.mahajan@gmail.com','9876543237','Jammu','2018-12-06'),
(39,'Anjali','Deshmukh','anjali.deshmukh@gmail.com','9876543238','Aurangabad','2018-12-10'),
(40,'Nitin','Pawar','nitin.pawar@gmail.com','9876543239','Nashik','2018-12-15'),
(41,'Bhavna','Roy','bhavna.roy@gmail.com','9876543240','Durgapur','2018-12-20'),
(42,'Yash','Thakur','yash.thakur@gmail.com','9876543241','Shimla','2018-12-24'),
(43,'Simran','Kaur','simran.kaur@gmail.com','9876543242','Patiala','2018-12-28'),
(44,'Aditya','Soni','aditya.soni@gmail.com','9876543243','Raipur','2019-01-02'),
(45,'Pallavi','Mohan','pallavi.mohan@gmail.com','9876543244','Gwalior','2019-01-07'),
(46,'Kishore','Naidu','kishore.naidu@gmail.com','9876543245','Tirupati','2019-01-12'),
(47,'Lavanya','Krishnan','lavanya.krishnan@gmail.com','9876543246','Madurai','2019-01-18'),
(48,'Hemant','Dubey','hemant.dubey@gmail.com','9876543247','Jabalpur','2019-01-23'),
(49,'Monika','Chawla','monika.chawla@gmail.com','9876543248','Agra','2019-01-28'),
(50,'Karthik','Raman','karthik.raman@gmail.com','9876543249','Mangaluru','2019-02-03');

INSERT INTO customer
(cust_id, first_name, last_name, email, phno, city, regi_date)
VALUES
(51,'Harsha','Reddy','harsha.reddy@gmail.com','9876543250','Hyderabad','2018-02-10'),
(52,'Deepika','Sharma','deepika.sharma@gmail.com','9876543251','Delhi','2018-02-18'),
(53,'Rohan','Gupta','rohan.gupta@gmail.com','9876543252','Mumbai','2018-03-02'),
(54,'Keerthana','Iyer','keerthana.iyer@gmail.com','9876543253','Chennai','2018-03-09'),
(55,'Naveen','Kumar','naveen.kumar@gmail.com','9876543254','Bengaluru','2018-03-16'),
(56,'Pallavi','Patel','pallavi.patel@gmail.com','9876543255','Ahmedabad','2018-03-25'),
(57,'Ajay','Yadav','ajay.yadav@gmail.com','9876543256','Lucknow','2018-04-01'),
(58,'Bhavya','Rao','bhavya.rao@gmail.com','9876543257','Visakhapatnam','2018-04-08'),
(59,'Chetan','Naik','chetan.naik@gmail.com','9876543258','Goa','2018-04-15'),
(60,'Ishaan','Malik','ishaan.malik@gmail.com','9876543259','Chandigarh','2018-04-22'),
(61,'Nisha','Sethi','nisha.sethi@gmail.com','9876543260','Noida','2018-05-01'),
(62,'Pradeep','Kulkarni','pradeep.kulkarni@gmail.com','9876543261','Pune','2018-05-09'),
(63,'Sanjana','Menon','sanjana.menon@gmail.com','9876543262','Kochi','2018-05-17'),
(64,'Tarun','Agarwal','tarun.agarwal@gmail.com','9876543263','Kanpur','2018-05-25'),
(65,'Vaishnavi','Joshi','vaishnavi.joshi@gmail.com','9876543264','Nagpur','2018-06-02'),
(66,'Yogesh','Mishra','yogesh.mishra@gmail.com','9876543265','Indore','2018-06-10'),
(67,'Anusha','Raman','anusha.raman@gmail.com','9876543266','Coimbatore','2018-06-18'),
(68,'Girish','Desai','girish.desai@gmail.com','9876543267','Surat','2018-06-25'),
(69,'Madhavi','Bhat','madhavi.bhat@gmail.com','9876543268','Mysuru','2018-07-03'),
(70,'Ritesh','Chopra','ritesh.chopra@gmail.com','9876543269','Jaipur','2018-07-10'),
(71,'Sowmya','Krishna','sowmya.krishna@gmail.com','9876543270','Vijayawada','2018-07-18'),
(72,'Uday','Shetty','uday.shetty@gmail.com','9876543271','Mangaluru','2018-07-26'),
(73,'Vinitha','Pillai','vinitha.pillai@gmail.com','9876543272','Thiruvananthapuram','2018-08-05'),
(74,'Kiran','Rastogi','kiran.rastogi@gmail.com','9876543273','Bhopal','2018-08-12'),
(75,'Zoya','Ali','zoya.ali@gmail.com','9876543274','Kolkata','2018-08-20');


INSERT INTO customer
(cust_id, first_name, last_name, email, phno, city, regi_date)
VALUES
(76,'Aarav','Kapoor','aarav.kapoor@gmail.com','9876543275','Delhi','2018-08-28'),
(77,'Diya','Malhotra','diya.malhotra@gmail.com','9876543276','Ludhiana','2018-09-04'),
(78,'Rohan','Bhatia','rohan.bhatia@gmail.com','9876543277','Amritsar','2018-09-12'),
(79,'Ishita','Arora','ishita.arora@gmail.com','9876543278','Gurugram','2018-09-20'),
(80,'Manish','Srivastava','manish.srivastava@gmail.com','9876543279','Prayagraj','2018-09-28'),
(81,'Shruti','Chauhan','shruti.chauhan@gmail.com','9876543280','Meerut','2018-10-05'),
(82,'Rajat','Saxena','rajat.saxena@gmail.com','9876543281','Ghaziabad','2018-10-13'),
(83,'Neeraj','Pandey','neeraj.pandey@gmail.com','9876543282','Patna','2018-10-20'),
(84,'Pooja','Tandon','pooja.tandon@gmail.com','9876543283','Ranchi','2018-10-28'),
(85,'Kunal','Singhania','kunal.singhania@gmail.com','9876543284','Raipur','2018-11-04'),
(86,'Riya','Bansal','riya.bansal@gmail.com','9876543285','Jodhpur','2018-11-12'),
(87,'Aditya','Maheshwari','aditya.maheshwari@gmail.com','9876543286','Udaipur','2018-11-20'),
(88,'Sakshi','Goel','sakshi.goel@gmail.com','9876543287','Agra','2018-11-28'),
(89,'Nikhil','Mittal','nikhil.mittal@gmail.com','9876543288','Bareilly','2018-12-05'),
(90,'Megha','Chawla','megha.chawla@gmail.com','9876543289','Dehradun','2018-12-13'),
(91,'Vishal','Arun','vishal.arun@gmail.com','9876543290','Tirupati','2018-12-20'),
(92,'Aditi','Shenoy','aditi.shenoy@gmail.com','9876543291','Hubballi','2018-12-27'),
(93,'Siddharth','Rane','siddharth.rane@gmail.com','9876543292','Nashik','2019-01-05'),
(94,'Bhavana','Kulshrestha','bhavana.kulshrestha@gmail.com','9876543293','Aurangabad','2019-01-12'),
(95,'Harsh','Dubey','harsh.dubey@gmail.com','9876543294','Jabalpur','2019-01-20'),
(96,'Anjali','Kale','anjali.kale@gmail.com','9876543295','Solapur','2019-01-28'),
(97,'Yash','Purohit','yash.purohit@gmail.com','9876543296','Ajmer','2019-02-04'),
(98,'Tanya','Dixit','tanya.dixit@gmail.com','9876543297','Gwalior','2019-02-12'),
(99,'Om','Bhardwaj','om.bhardwaj@gmail.com','9876543298','Vadodara','2019-02-20'),
(100,'Ananya','Prasad','ananya.prasad@gmail.com','9876543299','Bhubaneswar','2019-02-28');


SELECT * FROM customer;


INSERT INTO categories (cate_name, des)
VALUES
('Electronics','Smartphones, laptops, accessories and electronic gadgets'),
('Fashion','Men, women and kids clothing, footwear and accessories'),
('Home & Kitchen','Furniture, kitchen appliances and home essentials'),
('Books','Educational books, novels and magazines'),
('Beauty & Personal Care','Cosmetics, skincare and personal grooming products'),
('Sports & Fitness','Gym equipment, sports accessories and fitness products'),
('Toys & Games','Toys, puzzles, board games and educational games'),
('Groceries','Daily grocery items, beverages and packaged foods'),
('Health & Wellness','Medicines, healthcare devices and supplements'),
('Jewellery','Gold, silver, diamond and fashion jewellery'),
('Watches','Analog, digital and smart watches'),
('Footwear','Shoes, sandals, slippers and sports footwear'),
('Bags & Luggage','Backpacks, handbags, wallets and travel luggage'),
('Mobile Accessories','Chargers, earphones, power banks and phone cases'),
('Computers','Desktop PCs, monitors, keyboards and computer accessories'),
('Furniture','Beds, sofas, tables, chairs and office furniture'),
('Baby Products','Baby care products, diapers, toys and clothing'),
('Automotive','Car accessories, bike accessories and vehicle maintenance products'),
('Pet Supplies','Pet food, toys and grooming accessories'),
('Office Supplies','Stationery, printers, notebooks and office essentials');


SELECT * FROM categories;

TRUNCATE TABLE products;
INSERT INTO products
(pro_name, cate_id, price, stock_quantity, brand)
VALUES
('Galaxy M14 5G',1,13999.00,120,'Samsung'),
('iPhone 13',1,52999.00,50,'Apple'),
('Redmi Note 13',1,18999.00,100,'Xiaomi'),
('Boat Airdopes 141',14,1499.00,200,'Boat'),
('OnePlus Nord Buds 2',14,2799.00,180,'OnePlus'),
('HP Pavilion Laptop',15,64999.00,35,'HP'),
('Dell Inspiron 15',15,58999.00,40,'Dell'),
('Lenovo IdeaPad Slim 3',15,46999.00,55,'Lenovo'),
('Nike Air Max Shoes',12,7999.00,75,'Nike'),
('Puma Running Shoes',12,4999.00,90,'Puma'),
('Levis Mens Jeans',2,2299.00,150,'Levis'),
('Allen Solly Shirt',2,1699.00,130,'Allen Solly'),
('Prestige Pressure Cooker',3,2499.00,85,'Prestige'),
('Milton Water Bottle',3,699.00,210,'Milton'),
('The Alchemist',4,399.00,250,'HarperCollins'),
('Atomic Habits',4,599.00,180,'Random House'),
('Lakme Face Wash',5,249.00,170,'Lakme'),
('Mamaearth Vitamin C Serum',5,599.00,140,'Mamaearth'),
('Cosco Cricket Bat',6,1799.00,65,'Cosco'),
('Yonex Badminton Racket',6,3499.00,55,'Yonex'),
('Funskool Chess Board',7,799.00,100,'Funskool'),
('Maggi Noodles Pack',8,180.00,400,'Nestle'),
('Horlicks Health Drink',9,499.00,120,'Horlicks'),
('Titan Analog Watch',11,3999.00,70,'Titan'),
('American Tourister Backpack',13,2199.00,95,'American Tourister');


INSERT INTO products
(pro_name, cate_id, price, stock_quantity, brand)
VALUES
('Noise ColorFit Pro 5 Smartwatch',11,3499.00,85,'Noise'),
('Fire-Boltt Ninja Smartwatch',11,1999.00,110,'Fire-Boltt'),
('Fastrack Casual Watch',11,2499.00,95,'Fastrack'),
('Realme Power Bank 20000mAh',14,1799.00,150,'Realme'),
('Samsung 25W Fast Charger',14,1299.00,180,'Samsung'),
('Portronics USB Type-C Cable',14,399.00,250,'Portronics'),
('Wildcraft Laptop Backpack',13,1899.00,120,'Wildcraft'),
('Skybags Travel Trolley',13,4999.00,45,'Skybags'),
('Safari Duffel Bag',13,2199.00,70,'Safari'),
('Godrej Steel Almirah',16,15499.00,18,'Godrej'),
('Nilkamal Plastic Chair',16,899.00,150,'Nilkamal'),
('Durian Office Table',16,7499.00,35,'Durian'),
('Pampers Baby Diapers',17,699.00,220,'Pampers'),
('Johnson Baby Lotion',17,299.00,180,'Johnson & Johnson'),
('Mee Mee Baby Feeding Bottle',17,399.00,160,'Mee Mee'),
('Bosch Car Vacuum Cleaner',18,2499.00,65,'Bosch'),
('Michelin Tyre Inflator',18,3299.00,40,'Michelin'),
('3M Car Cleaning Kit',18,999.00,130,'3M'),
('Pedigree Adult Dog Food',19,2499.00,95,'Pedigree'),
('Whiskas Cat Food',19,899.00,110,'Whiskas'),
('Pet Grooming Brush',19,349.00,140,'Petmate'),
('Classmate Notebook Pack',20,299.00,280,'Classmate'),
('HP Ink Cartridge 680',20,1199.00,90,'HP'),
('Cello Ball Pens Pack',20,149.00,350,'Cello'),
('Canon Pixma Printer',20,6499.00,30,'Canon');

INSERT INTO products
(pro_name, cate_id, price, stock_quantity, brand)
VALUES
('Sony WH-CH520 Headphones',1,4499.00,80,'Sony'),
('LG 260L Double Door Refrigerator',1,28999.00,25,'LG'),
('IFB Front Load Washing Machine',1,35999.00,18,'IFB'),
('Mi Smart TV 43 Inch',1,27999.00,30,'Xiaomi'),
('Philips Air Fryer',3,7999.00,55,'Philips'),
('Butterfly Mixer Grinder',3,3499.00,75,'Butterfly'),
('Bajaj Electric Kettle',3,1499.00,90,'Bajaj'),
('Cello Dinner Set',3,1899.00,65,'Cello'),
('Rich Dad Poor Dad',4,399.00,200,'Plata Publishing'),
('Think and Grow Rich',4,349.00,180,'Fingerprint'),
('The Psychology of Money',4,499.00,170,'Jaico'),
('Ikigai',4,450.00,160,'Penguin'),
('Minimalist Face Serum',5,699.00,120,'Minimalist'),
('Nivea Body Lotion',5,299.00,180,'Nivea'),
('Dove Shampoo',5,399.00,160,'Dove'),
('Himalaya Face Wash',5,249.00,190,'Himalaya'),
('Adidas Football',6,1599.00,90,'Adidas'),
('SG Cricket Kit',6,5999.00,35,'SG'),
('Vector X Basketball',6,899.00,85,'Vector X'),
('Decathlon Yoga Mat',6,999.00,110,'Decathlon'),
('Ludo Board Game',7,399.00,130,'Funskool'),
('Hot Wheels Car Set',7,899.00,95,'Mattel'),
('LEGO Classic Bricks Box',7,2499.00,40,'LEGO'),
('Cadbury Celebration Pack',8,349.00,250,'Cadbury'),
('Tata Tea Gold 1kg',8,699.00,150,'Tata');

INSERT INTO products
(pro_name, cate_id, price, stock_quantity, brand)
VALUES
('Apple iPad 10th Gen',1,39999.00,25,'Apple'),
('Samsung Galaxy Tab A9',1,18999.00,45,'Samsung'),
('ASUS VivoBook 15',15,54999.00,30,'ASUS'),
('Acer Aspire 5',15,48999.00,35,'Acer'),
('JBL Flip 6 Bluetooth Speaker',1,8999.00,60,'JBL'),
('Canon EOS 1500D Camera',1,42999.00,18,'Canon'),
('Prestige Induction Cooktop',3,2799.00,80,'Prestige'),
('Pigeon Non-Stick Cookware Set',3,2499.00,70,'Pigeon'),
('Milton Thermosteel Flask',3,899.00,120,'Milton'),
('Wooden Study Table',16,6999.00,25,'Home Centre'),
('Godrej Office Chair',16,5999.00,40,'Godrej'),
('Wakefit Memory Foam Mattress',16,12999.00,22,'Wakefit'),
('Peter England Formal Shirt',2,1799.00,140,'Peter England'),
('Van Heusen Trousers',2,2499.00,110,'Van Heusen'),
('Biba Womens Kurti',2,1599.00,125,'Biba'),
('W for Woman Kurta',2,1999.00,95,'W'),
('Campus Running Shoes',12,2299.00,130,'Campus'),
('Sparx Sports Shoes',12,1899.00,150,'Sparx'),
('Fastrack Sunglasses',2,1499.00,90,'Fastrack'),
('Titan Wallet',13,1299.00,85,'Titan'),
('Dabur Honey 1kg',8,449.00,180,'Dabur'),
('Fortune Sunflower Oil 5L',8,899.00,95,'Fortune'),
('Aashirvaad Atta 10kg',8,549.00,140,'Aashirvaad'),
('Dettol Hand Wash',9,199.00,200,'Dettol'),
('Dr. Morepen Digital Thermometer',9,349.00,160,'Dr. Morepen');


SELECT * FROM products;


INSERT INTO orders
(cust_id, order_date, total_amount, order_status)
VALUES
(1,'2018-01-05',15498.00,'Delivered'),
(2,'2018-01-08',2499.00,'Delivered'),
(3,'2018-01-12',18999.00,'Shipped'),
(4,'2018-01-18',699.00,'Delivered'),
(5,'2018-01-22',52999.00,'Delivered'),
(6,'2018-01-26',399.00,'Cancelled'),
(7,'2018-02-01',7999.00,'Delivered'),
(8,'2018-02-04',1499.00,'Pending'),
(9,'2018-02-10',46999.00,'Delivered'),
(10,'2018-02-14',2799.00,'Shipped'),
(11,'2018-02-18',2199.00,'Delivered'),
(12,'2018-02-22',64999.00,'Delivered'),
(13,'2018-02-27',999.00,'Pending'),
(14,'2018-03-03',4999.00,'Delivered'),
(15,'2018-03-08',3999.00,'Delivered'),
(16,'2018-03-12',599.00,'Cancelled'),
(17,'2018-03-18',3499.00,'Shipped'),
(18,'2018-03-22',799.00,'Delivered'),
(19,'2018-03-28',1899.00,'Delivered'),
(20,'2018-04-02',27999.00,'Delivered'),
(21,'2018-04-06',249.00,'Pending'),
(22,'2018-04-11',5999.00,'Delivered'),
(23,'2018-04-16',349.00,'Delivered'),
(24,'2018-04-20',8999.00,'Shipped'),
(25,'2018-04-25',2299.00,'Delivered');


INSERT INTO orders
(cust_id, order_date, total_amount, order_status)
VALUES
(26,'2018-05-02',3499.00,'Delivered'),
(27,'2018-05-05',1999.00,'Delivered'),
(28,'2018-05-08',15499.00,'Shipped'),
(29,'2018-05-12',899.00,'Delivered'),
(30,'2018-05-16',42999.00,'Delivered'),
(31,'2018-05-20',2499.00,'Pending'),
(32,'2018-05-24',5999.00,'Delivered'),
(33,'2018-05-28',699.00,'Delivered'),
(34,'2018-06-01',1899.00,'Cancelled'),
(35,'2018-06-05',799.00,'Delivered'),
(36,'2018-06-09',39999.00,'Shipped'),
(37,'2018-06-13',54999.00,'Delivered'),
(38,'2018-06-17',499.00,'Delivered'),
(39,'2018-06-21',349.00,'Pending'),
(40,'2018-06-25',2299.00,'Delivered'),
(41,'2018-06-29',6999.00,'Delivered'),
(42,'2018-07-03',999.00,'Shipped'),
(43,'2018-07-07',24999.00,'Delivered'),
(44,'2018-07-11',1499.00,'Cancelled'),
(45,'2018-07-15',1799.00,'Delivered'),
(46,'2018-07-19',599.00,'Pending'),
(47,'2018-07-23',8999.00,'Delivered'),
(48,'2018-07-27',4499.00,'Delivered'),
(49,'2018-07-30',12999.00,'Shipped'),
(50,'2018-08-03',299.00,'Delivered');


INSERT INTO orders
(cust_id, order_date, total_amount, order_status)
VALUES
(51,'2018-08-08',899.00,'Delivered'),
(52,'2018-08-12',2499.00,'Delivered'),
(53,'2018-08-16',64999.00,'Delivered'),
(54,'2018-08-20',599.00,'Pending'),
(55,'2018-08-24',1599.00,'Delivered'),
(56,'2018-08-28',3499.00,'Shipped'),
(57,'2018-09-02',999.00,'Delivered'),
(58,'2018-09-06',27999.00,'Delivered'),
(59,'2018-09-10',399.00,'Cancelled'),
(60,'2018-09-14',7999.00,'Delivered'),
(61,'2018-09-18',1199.00,'Pending'),
(62,'2018-09-22',54999.00,'Delivered'),
(63,'2018-09-26',299.00,'Delivered'),
(64,'2018-09-30',1999.00,'Shipped'),
(65,'2018-10-04',5999.00,'Delivered'),
(66,'2018-10-08',449.00,'Delivered'),
(67,'2018-10-12',24999.00,'Delivered'),
(68,'2018-10-16',349.00,'Pending'),
(69,'2018-10-20',18999.00,'Delivered'),
(70,'2018-10-24',1499.00,'Delivered'),
(71,'2018-10-28',6999.00,'Shipped'),
(72,'2018-11-02',2299.00,'Delivered'),
(73,'2018-11-06',3999.00,'Delivered'),
(74,'2018-11-10',1299.00,'Cancelled'),
(75,'2018-11-14',8999.00,'Delivered');


INSERT INTO orders
(cust_id, order_date, total_amount, order_status)
VALUES
(76,'2018-11-18',2799.00,'Delivered'),
(77,'2018-11-22',1899.00,'Delivered'),
(78,'2018-11-26',52999.00,'Shipped'),
(79,'2018-11-30',249.00,'Pending'),
(80,'2018-12-04',39999.00,'Delivered'),
(81,'2018-12-08',799.00,'Cancelled'),
(82,'2018-12-12',12999.00,'Delivered'),
(83,'2018-12-16',5999.00,'Shipped'),
(84,'2018-12-20',3499.00,'Delivered'),
(85,'2018-12-24',499.00,'Pending'),
(86,'2018-12-28',899.00,'Delivered'),
(87,'2019-01-02',6999.00,'Delivered'),
(88,'2019-01-06',2499.00,'Shipped'),
(89,'2019-01-10',18999.00,'Delivered'),
(90,'2019-01-14',349.00,'Cancelled'),
(91,'2019-01-18',54999.00,'Delivered'),
(92,'2019-01-22',999.00,'Pending'),
(93,'2019-01-26',4499.00,'Delivered'),
(94,'2019-01-30',2299.00,'Shipped'),
(95,'2019-02-03',1599.00,'Delivered'),
(96,'2019-02-07',24999.00,'Delivered'),
(97,'2019-02-11',399.00,'Pending'),
(98,'2019-02-15',8999.00,'Delivered'),
(99,'2019-02-20',1499.00,'Delivered'),
(100,'2019-02-25',599.00,'Cancelled');


SELECT *FROM orders;


TRUNCATE TABLE order_items;
INSERT INTO order_items (order_id, pro_id, quantity, unit_price)
VALUES
(1,1,1,13999.00),

(2,13,1,2499.00),

(3,3,1,18999.00),

(4,14,1,699.00),

(5,2,1,52999.00),

(6,15,1,399.00),

(7,9,1,7999.00),

(8,4,1,1499.00),

(9,8,1,46999.00),

(10,5,1,2799.00),

(11,25,1,2199.00),

(12,6,1,64999.00),

(13,43,1,999.00),

(14,34,1,4999.00),

(15,24,1,3999.00),

(16,18,1,599.00),

(17,20,1,3499.00),

(18,21,1,799.00),

(19,35,1,15499.00),

(20,54,1,27999.00),

(21,17,1,249.00),

(22,68,1,5999.00),

(23,74,1,349.00),

(24,80,1,8999.00),

(25,93,1,1799.00);



INSERT INTO order_items (order_id, pro_id, quantity, unit_price)
VALUES
(26,26,1,3499.00),

(27,27,1,1999.00),

(28,35,1,15499.00),

(29,36,1,899.00),

(30,81,1,42999.00),

(31,84,1,2499.00),

(32,69,1,5999.00),

(33,38,1,699.00),

(34,39,1,299.00),

(35,21,1,799.00),

(36,76,1,39999.00),

(37,78,1,54999.00),

(38,60,1,349.00),

(39,61,1,499.00),

(40,94,1,1999.00),

(41,86,1,6999.00),

(42,70,1,999.00),

(43,55,1,7999.00),

(44,31,1,399.00),

(45,89,1,1799.00),

(46,18,1,599.00),

(47,80,1,8999.00),

(48,51,1,4499.00),

(49,87,1,12999.00),

(50,47,1,299.00);


INSERT INTO order_items (order_id, pro_id, quantity, unit_price)
VALUES
(51,85,1,899.00),

(52,84,1,2499.00),

(53,6,1,64999.00),

(54,18,1,599.00),

(55,91,1,1599.00),

(56,26,1,3499.00),

(57,70,1,999.00),

(58,54,1,27999.00),

(59,15,1,399.00),

(60,55,1,7999.00),

(61,48,1,1199.00),

(62,79,1,54999.00),

(63,39,1,299.00),

(64,28,1,2499.00),

(65,69,1,5999.00),

(66,96,1,449.00),

(67,77,1,18999.00),

(68,74,1,349.00),

(69,3,1,18999.00),

(70,30,1,1299.00),

(71,86,1,6999.00),

(72,11,1,2299.00),

(73,24,1,3999.00),

(74,95,1,2299.00),

(75,80,1,8999.00);

INSERT INTO order_items (order_id, pro_id, quantity, unit_price)
VALUES
(76,5,1,2799.00),

(77,84,1,2499.00),

(78,2,1,52999.00),

(79,17,1,249.00),

(80,76,1,39999.00),

(81,21,1,799.00),

(82,87,1,12999.00),

(83,68,1,5999.00),

(84,26,1,3499.00),

(85,61,1,499.00),

(86,85,1,899.00),

(87,86,1,6999.00),

(88,84,1,2499.00),

(89,77,1,18999.00),

(90,74,1,349.00),

(91,79,1,54999.00),

(92,70,1,999.00),

(93,51,1,4499.00),

(94,11,1,2299.00),

(95,91,1,1599.00),

(96,67,1,24999.00),

(97,15,1,399.00),

(98,80,1,8999.00),

(99,4,1,1499.00),

(100,18,1,599.00);

SELECT *FROM order_items;

UPDATE orders o
JOIN (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS total
    FROM order_items
    GROUP BY order_id
) 
ON o.order_id = t.order_id
SET o.total_amount = t.total;

SELECT
    o.order_id,
    o.total_amount,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING o.total_amount <> calculated_total;


INSERT INTO payments
(order_id, pay_date, amount, pay_method, pay_status)
VALUES
(1,'2018-01-05',15498.00,'UPI','Completed'),
(2,'2018-01-08',2499.00,'Credit Card','Completed'),
(3,'2018-01-13',18999.00,'Debit Card','Completed'),
(4,'2018-01-18',699.00,'Cash on Delivery','Completed'),
(5,'2018-01-23',52999.00,'Net Banking','Completed'),
(6,'2018-01-26',399.00,'UPI','Refunded'),
(7,'2018-02-02',7999.00,'Credit Card','Completed'),
(8,'2018-02-04',1499.00,'Cash on Delivery','Pending'),
(9,'2018-02-11',46999.00,'Net Banking','Completed'),
(10,'2018-02-15',2799.00,'UPI','Completed'),
(11,'2018-02-19',2199.00,'Debit Card','Completed'),
(12,'2018-02-28',64999.00,'Credit Card','Completed'),
(13,'2018-02-27',999.00,'Cash on Delivery','Pending'),
(14,'2018-03-04',4999.00,'UPI','Completed'),
(15,'2018-03-09',3999.00,'Debit Card','Completed'),
(16,'2018-03-12',599.00,'Credit Card','Refunded'),
(17,'2018-03-19',3499.00,'Net Banking','Completed'),
(18,'2018-03-23',799.00,'UPI','Completed'),
(19,'2018-03-29',15499.00,'Debit Card','Completed'),
(20,'2018-04-03',27999.00,'Credit Card','Completed'),
(21,'2018-04-06',249.00,'Cash on Delivery','Pending'),
(22,'2018-04-12',5999.00,'UPI','Completed'),
(23,'2018-04-17',349.00,'Debit Card','Completed'),
(24,'2018-04-21',8999.00,'Net Banking','Completed'),
(25,'2018-04-26',1799.00,'Credit Card','Completed');


INSERT INTO payments
(order_id, pay_date, amount, pay_method, pay_status)
VALUES
(26,'2018-05-03',3499.00,'UPI','Completed'),
(27,'2018-05-06',1999.00,'Credit Card','Completed'),
(28,'2018-05-09',15499.00,'Net Banking','Completed'),
(29,'2018-05-13',899.00,'Debit Card','Completed'),
(30,'2018-05-17',42999.00,'Credit Card','Completed'),
(31,'2018-05-21',2499.00,'Cash on Delivery','Pending'),
(32,'2018-05-25',5999.00,'UPI','Completed'),
(33,'2018-05-29',699.00,'Debit Card','Completed'),
(34,'2018-06-02',299.00,'Credit Card','Refunded'),
(35,'2018-06-06',799.00,'UPI','Completed'),
(36,'2018-06-10',39999.00,'Net Banking','Completed'),
(37,'2018-06-14',54999.00,'Credit Card','Completed'),
(38,'2018-06-18',349.00,'Debit Card','Completed'),
(39,'2018-06-22',499.00,'Cash on Delivery','Pending'),
(40,'2018-06-26',1999.00,'UPI','Completed'),
(41,'2018-06-30',6999.00,'Credit Card','Completed'),
(42,'2018-07-04',999.00,'Net Banking','Completed'),
(43,'2018-07-08',7999.00,'Debit Card','Completed'),
(44,'2018-07-12',399.00,'Credit Card','Refunded'),
(45,'2018-07-16',1799.00,'UPI','Completed'),
(46,'2018-07-20',599.00,'Cash on Delivery','Pending'),
(47,'2018-07-24',8999.00,'Credit Card','Completed'),
(48,'2018-07-28',4499.00,'UPI','Completed'),
(49,'2018-07-31',12999.00,'Net Banking','Completed'),
(50,'2018-08-04',299.00,'Debit Card','Completed');

INSERT INTO payments
(order_id, pay_date, amount, pay_method, pay_status)
VALUES
(51,'2018-08-09',899.00,'UPI','Completed'),
(52,'2018-08-13',2499.00,'Credit Card','Completed'),
(53,'2018-08-17',64999.00,'Net Banking','Completed'),
(54,'2018-08-21',599.00,'Cash on Delivery','Pending'),
(55,'2018-08-25',1599.00,'Debit Card','Completed'),
(56,'2018-08-29',3499.00,'UPI','Completed'),
(57,'2018-09-03',999.00,'Credit Card','Completed'),
(58,'2018-09-07',27999.00,'Net Banking','Completed'),
(59,'2018-09-11',399.00,'Credit Card','Refunded'),
(60,'2018-09-15',7999.00,'Debit Card','Completed'),
(61,'2018-09-19',1199.00,'Cash on Delivery','Pending'),
(62,'2018-09-23',54999.00,'UPI','Completed'),
(63,'2018-09-27',299.00,'Credit Card','Completed'),
(64,'2018-10-01',2499.00,'Debit Card','Completed'),
(65,'2018-10-05',5999.00,'Net Banking','Completed'),
(66,'2018-10-09',449.00,'UPI','Completed'),
(67,'2018-10-13',18999.00,'Credit Card','Completed'),
(68,'2018-10-17',349.00,'Cash on Delivery','Pending'),
(69,'2018-10-21',18999.00,'Debit Card','Completed'),
(70,'2018-10-25',1299.00,'UPI','Completed'),
(71,'2018-10-29',6999.00,'Credit Card','Completed'),
(72,'2018-11-03',2299.00,'Net Banking','Completed'),
(73,'2018-11-07',3999.00,'Debit Card','Completed'),
(74,'2018-11-11',2299.00,'Credit Card','Refunded'),
(75,'2018-11-15',8999.00,'UPI','Completed');

INSERT INTO payments
(order_id, pay_date, amount, pay_method, pay_status)
VALUES
(76,'2018-11-19',2799.00,'UPI','Completed'),
(77,'2018-11-23',2499.00,'Credit Card','Completed'),
(78,'2018-11-27',52999.00,'Net Banking','Completed'),
(79,'2018-12-01',249.00,'Cash on Delivery','Pending'),
(80,'2018-12-05',39999.00,'Debit Card','Completed'),
(81,'2018-12-09',799.00,'Credit Card','Refunded'),
(82,'2018-12-13',12999.00,'UPI','Completed'),
(83,'2018-12-17',5999.00,'Net Banking','Completed'),
(84,'2018-12-21',3499.00,'Credit Card','Completed'),
(85,'2018-12-25',499.00,'Cash on Delivery','Pending'),
(86,'2018-12-29',899.00,'Debit Card','Completed'),
(87,'2019-01-03',6999.00,'UPI','Completed'),
(88,'2019-01-07',2499.00,'Credit Card','Completed'),
(89,'2019-01-11',18999.00,'Net Banking','Completed'),
(90,'2019-01-15',349.00,'Credit Card','Refunded'),
(91,'2019-01-19',54999.00,'Debit Card','Completed'),
(92,'2019-01-23',999.00,'Cash on Delivery','Pending'),
(93,'2019-01-27',4499.00,'UPI','Completed'),
(94,'2019-01-31',2299.00,'Credit Card','Completed'),
(95,'2019-02-04',1599.00,'Net Banking','Completed'),
(96,'2019-02-08',24999.00,'Debit Card','Completed'),
(97,'2019-02-12',399.00,'Cash on Delivery','Pending'),
(98,'2019-02-16',8999.00,'UPI','Completed'),
(99,'2019-02-21',1499.00,'Credit Card','Completed'),
(100,'2019-02-26',599.00,'Credit Card','Refunded');


SELECT *FROM payments;


SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM payments;


SELECT *
FROM orders o
LEFT JOIN customer c
ON o.cust_id = c.cust_id
WHERE c.cust_id IS NULL;

SELECT *
FROM products p
LEFT JOIN categories c
ON p.cate_id = c.cate_id
WHERE c.cate_id IS NULL;

SELECT *
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT *
FROM order_items oi
LEFT JOIN products p
ON oi.pro_id = p.pro_id
WHERE p.pro_id IS NULL;

SELECT *
FROM payments p
LEFT JOIN orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT
    o.order_id,
    o.total_amount,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING o.total_amount <> calculated_total;