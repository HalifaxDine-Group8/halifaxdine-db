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

INSERT INTO Feedback(Fdbck_Content,Emp_ID,Brch_ID) VALUES ("Halifax is nice",1,1);
INSERT INTO Feedback(Fdbck_Content,Emp_ID,Brch_ID) VALUES ("Toronto is nice",2,2);

INSERT INTO Shift(Emp_ID,Shift_Date) VALUES(1,"2019-1-1");
INSERT INTO Shift(Emp_ID,Shift_Date) VALUES(2,"2019-1-1");

INSERT INTO Ingredient(Ingrdt_Name) VALUES("Bread");
INSERT INTO Ingredient(Ingrdt_Name) VALUES("Meat");

INSERT INTO Menu_Item(Item_Name,Item_Cost) VALUES("Sandwhich",100);
INSERT INTO Menu_Item(Item_Name,Item_Cost) VALUES("Steak",10);

INSERT INTO Recipe(Ingrdt_ID,Item_ID,Rcp_AmountReq) VALUES(1,1,2); #Sandwhich needs two Bread
INSERT INTO Recipe(Ingrdt_ID,Item_ID,Rcp_AmountReq) VALUES(2,1,1); #Sandwhich needs one Meat

INSERT INTO Stock(Ingrdt_ID,Brch_ID,Stck_QOH) VALUES(1,1,100); 
INSERT INTO Stock(Ingrdt_ID,Brch_ID,Stck_QOH) VALUES(2,1,100); 
INSERT INTO Stock(Ingrdt_ID,Brch_ID,Stck_QOH) VALUES(1,2,100); 
INSERT INTO Stock(Ingrdt_ID,Brch_ID,Stck_QOH) VALUES(2,2,100);

INSERT INTO Delivery(Stck_ID,Dlv_Amount,Dlv_Received,Dlv_Cost) VALUES(1,2,0,10);
INSERT INTO Delivery(Stck_ID,Dlv_Amount,Dlv_Received,Dlv_Cost) VALUES(3,2,0,10);

#ADDRESS PROBABLY NOT NEEDED
INSERT INTO Customer(Cust_FName,Cust_LName,Cust_Addr) VALUES("Customer","Last","Happy Street");
INSERT INTO Customer(Cust_FName,Cust_LName,Cust_Addr) VALUES("Custy","Another Name","Sad Street");

INSERT INTO Bill(Brch_ID,Bill_Total,Bill_State) VALUES(1,-1,"Not Set");
INSERT INTO Bill(Brch_ID,Bill_Total,Bill_State) VALUES(2,-1,"Not Set");

INSERT INTO Bill_Detail(Item_ID,Bill_ID,BillDet_Count) VALUES(1,1,2);
UPDATE Bill AS B1
SET Bill_Total = (
	SELECT	SUM(BillDet_Count*Item_Cost)
		FROM Bill_Detail AS B2
			JOIN Menu_Item USING(Item_ID) 
			WHERE B2.Bill_ID = B1.Bill_ID
			GROUP BY Bill_ID
)
WHERE B1.Bill_ID = 1;
UPDATE Bill  SET Bill_State = "Not Prepared" WHERE Bill_ID = 1;

INSERT INTO Bill_Detail(Item_ID,Bill_ID,BillDet_Count) VALUES(1,2,1);
INSERT INTO Bill_Detail(Item_ID,Bill_ID,BillDet_Count) VALUES(2,2,2);
UPDATE Bill AS B1
SET Bill_Total = (
	SELECT	SUM(BillDet_Count*Item_Cost)
		FROM Bill_Detail AS B2
			JOIN Menu_Item USING(Item_ID) 
			WHERE B2.Bill_ID = B1.Bill_ID
			GROUP BY Bill_ID
)
WHERE B1.Bill_ID = 2;
UPDATE Bill  SET Bill_State = "Not Prepared" WHERE Bill_ID = 2;

INSERT INTO Online_Bill(Cust_ID,Cook_ID,Bill_ID) VALUES(1,5,1);

INSERT INTO Instore_Bill(Attend_ID,Cook_ID,Bill_ID) VALUES(2,6,2);

UPDATE Bill SET Bill_State = "Prepared" WHERE Bill_ID = 1;
