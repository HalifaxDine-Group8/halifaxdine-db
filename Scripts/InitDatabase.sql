#IF LOCAL
#DROP SCHEMA IF EXISTS ProjTest; 
#CREATE SCHEMA ProjTest;
#USE ProjTest;

#IF BLUENOSE
#USE CSID;

DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Shift;
DROP TABLE IF EXISTS Recipe;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Instore_Order;
DROP TABLE IF EXISTS Online_Order;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Employee_Class;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Ingredient;
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Meal;

CREATE TABLE Branch (
	Brch_ID INT(5) NOT NULL UNIQUE,
	Brch_Name VARCHAR(100) NOT NULL,
	PRIMARY KEY(Brch_ID)
);

CREATE TABLE Employee_Class (
	EmpClass_ID INT(5) NOT NULL UNIQUE,
	EmpClass_Rate INT(5)  NOT NULL,
	EmpClass_Desc VARCHAR(100) NOT NULL,
	PRIMARY KEY(EmpClass_ID)
);

CREATE TABLE Employee (
	Emp_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Emp_FName VARCHAR(100) NOT NULL,
 	Emp_LName VARCHAR(100) NOT NULL,
	EmpClass_ID INT(5) NOT NULL,
    Brch_ID INT(5) NOT NULL,
   	PRIMARY KEY(Emp_ID),
	FOREIGN KEY(EmpClass_ID) REFERENCES Employee_Class(EmpClass_ID),
    FOREIGN KEY(Brch_ID) REFERENCES Branch(Brch_ID)
);

CREATE TABLE Feedback (
	Fdbck_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Fdbck_Content VARCHAR(1000) NOT NULL, 
	Emp_ID INT(5) NOT NULL,
	Brch_ID INT(5)NOT NULL,
	PRIMARY KEY(Fdbck_ID),
	FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID),
	FOREIGN KEY(Brch_ID) REFERENCES Branch(Brch_ID)
);

CREATE TABLE Shift (
	Shift_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Emp_ID INT(5) NOT NULL,
	Shift_Date DATE NOT NULL,
	PRIMARY KEY(Shift_ID),
	FOREIGN KEY(Emp_ID) REFERENCES Employee(Emp_ID)
);

CREATE TABLE Ingredient (
	Ingrdt_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Ingrdt_Name VARCHAR(100) NOT NULL,
	PRIMARY KEY(Ingrdt_ID)
);

CREATE TABLE Meal (
	Meal_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Meal_Name VARCHAR(100) NOT NULL,
	Meal_Cost INT(5) NOT NULL,
	PRIMARY KEY(Meal_ID)
);

CREATE TABLE Recipe (
	Rcp_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Ingrdt_ID INT(5) NOT NULL,
	Meal_ID INT(5) NOT NULL,
	Rcp_AmountReq INT(5)NOT NULL,
	PRIMARY KEY(Rcp_ID),
	FOREIGN KEY(Ingrdt_ID) REFERENCES Ingredient(Ingrdt_ID),
	FOREIGN KEY(Meal_ID) REFERENCES Meal(Meal_ID)
);

CREATE TABLE Stock (
	Stck_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Ingrdt_ID INT(5) NOT NULL,
	Brch_ID INT(5) NOT NULL,
	Stck_QOH INT(5)NOT NULL,
	PRIMARY KEY(Stck_ID),
	FOREIGN KEY(Ingrdt_ID) REFERENCES Ingredient(Ingrdt_ID),
	FOREIGN KEY(Brch_ID) REFERENCES Branch(Brch_ID)
);

CREATE TABLE Delivery (
	Dlv_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Stck_ID INT(5) NOT NULL,
	Dlv_Amount INT(5) NOT NULL,
    Dlv_Date DATE NOT NULL,
    Dlv_Cost INT(5) NOT NULL,
	PRIMARY KEY(Dlv_ID),
	FOREIGN KEY(Stck_ID) REFERENCES Stock(Stck_ID)
);

CREATE TABLE Customer (
	Cust_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Cust_FName VARCHAR(100)NOT NULL,
	Cust_LName VARCHAR(100)NOT NULL,
	Cust_Addr VARCHAR(100)NOT NULL,
	PRIMARY KEY(Cust_ID)
);

CREATE TABLE Order_Details (
	OrderDet_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Meal_ID INT(5) NOT NULL,
	OrderDet_Count INT(5) NOT NULL,
	PRIMARY KEY(OrderDet_ID),
	FOREIGN KEY(Meal_ID) REFERENCES Meal(Meal_ID)
);

CREATE TABLE Orders (
	Order_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Brch_ID INT(5) NOT NULL,
	OrderDet_ID INT(5) NOT NULL,
	Order_Total INT(5) NOT NULL,
    Order_State VARCHAR(100) NOT NULL,
	PRIMARY KEY(Order_ID),
	FOREIGN KEY(OrderDet_ID) REFERENCES Order_Details(OrderDet_ID),
	FOREIGN KEY(Brch_ID) REFERENCES Branch(Brch_ID)
);

CREATE TABLE Online_Order (
	OnOrder_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Cust_ID INT(5) NOT NULL,
	Cook_ID INT(5) NOT NULL,
    Order_ID INT(5) NOT NULL,
	PRIMARY KEY(OnOrder_ID),
	FOREIGN KEY(Cust_ID) REFERENCES Customer(Cust_ID),
	FOREIGN KEY(Cook_ID) REFERENCES Employee(Emp_ID),
    FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Instore_Order (
	InOrder_ID INT(5) NOT NULL UNIQUE AUTO_INCREMENT,
	Attend_ID INT(5) NOT NULL,
	Cook_ID INT(5) NOT NULL,
    Order_ID INT(5) NOT NULL,
	PRIMARY KEY(InOrder_ID),
	FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID),
	FOREIGN KEY(Cook_ID) REFERENCES Employee(Emp_ID),
    FOREIGN KEY(Attend_ID) REFERENCES Employee(Emp_ID)
);


#Branch data
INSERT INTO Branch VALUES (1,"Halifax");
INSERT INTO Branch VALUES (2,"Toronto");


#Employee Classes
INSERT INTO Employee_Class VALUES (1,20,"Attendant");
INSERT INTO Employee_Class VALUES (2,20,"Head Cook");
INSERT INTO Employee_Class VALUES (3,20,"Chef");
INSERT INTO Employee_Class VALUES (4,20,"Manager");
INSERT INTO Employee_Class VALUES (5,20,"Branch Manager");


#Employee 
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","Attendant1",1,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","Attendant1",1,2);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","Attendant2",1,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","Attendant2",1,2);

INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","HeadCook1",2,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","HeadCook1",2,2);

INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","Chef1",3,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","Chef1",3,2);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","Chef2",3,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","Chef2",3,2);

INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnHalifax","Manager1",4,1);
INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("JohnToronto","Manager1",4,2);

INSERT INTO Employee(Emp_FName,Emp_LName,EmpClass_ID,Brch_ID) VALUES ("DA BOSS","BranchManny",5,2);










