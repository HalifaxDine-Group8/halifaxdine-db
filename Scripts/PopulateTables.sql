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