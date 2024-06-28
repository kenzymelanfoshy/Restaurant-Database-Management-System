CREATE TABLE employees(employee_id NUMBER(3) CONSTRAINT emp_id PRIMARY KEY,
                       first_name VARCHAR2(15) NOT NULL,
                       last_name VARCHAR2(15) NOT NULL,
                       address VARCHAR2(50),
                       SSN NUMBER(14) NOT NULL,
                       email VARCHAR2(30) NOT NULL ,
                       hire_date DATE,
                       salary NUMBER(6),
                       commission_pct NUMBER(5),
                       date_of_birth DATE NOT NULL,
                       military_status VARCHAR2(20),
                       status VARCHAR2(10) NOT NULL,
                       manager_id NUMBER(3),
                       department_id NUMBER(5) NOT NULL,
                       job_id VARCHAR2(10) NOT NULL,
                       gender CHAR(6) NOT NULL);
                       

CREATE TABLE employee_phone(employee_phone_id NUMBER(5) CONSTRAINT e_phn_id PRIMARY KEY,
                            employee_id NUMBER(3),
                            phone_type VARCHAR2(20),
                            phone_number NUMBER(11));


CREATE TABLE customers(customer_id NUMBER(10) CONSTRAINT cus_id PRIMARY KEY,
                        first_name VARCHAr2(50),
                        last_name VARCHAR2(50));


CREATE TABLE departments (department_id NUMBER(5) CONSTRAINT dept_id PRIMARY KEY,
                          department_name VARCHAR2(20),
                          manager_id NUMBER(3));


CREATE TABLE jobs(job_id VARCHAR2(10) CONSTRAINT jb_id PRIMARY KEY,
                  job_title VARCHAR2(20) NOT NULL,
                  min_salary NUMBER(15)NOT NULL,
                  max_salary NUMBER(15)NOT NULL );


CREATE TABLE orders(order_id NUMBER(10) CONSTRAINT ordr_id PRIMARY KEY,
                    employee_id NUMBER(3),
                    order_date DATE,
                    customer_id NUMBER(10),
                    item_id NUMBER(10) NOT NULL ,
                    item_name VARCHAR2(50)NOT NULL ,
                    quantity NUMBER(10) NOT NULL,
                    total_price NUMBER(10) NOT NULL,
                    order_item_id NUMBER(15));


CREATE TABLE items(item_id NUMBER(15) CONSTRAINT itm_id PRIMARY KEY,
                         item_name VARCHAR2(50),
                         order_id NUMBER(10),
                         item_quantity NUMBER(10),
                         employee_id NUMBER(3),
                         customer_id NUMBER(10));


CREATE TABLE vendors (vendor_id NUMBER(5) CONSTRAINT ved_id PRIMARY KEY,
                      location VARCHAR2(100),
                      supplies VARCHAR2(50),
                      balance NUMBER(30));


CREATE TABLE vendor_phone(phone_id NUMBER(5) CONSTRAINT v_phn_id PRIMARY KEY,
                          vendor_id NUMBER(5),
                          phone_type VARCHAR2(20),
                          phone_number NUMBER(11));


CREATE TABLE shift(shift_id NUMBER(20) CONSTRAINT shft_id PRIMARY KEY,
                    employee_id NUMBER(3),
                    shift_type VARCHAR2(10));


CREATE TABLE store(item_id NUMBER(15),
                    item_name VARCHAR2(50),
                    quantity NUMBER(10),
                    status VARCHAR2(20),
                    exp_date DATE,
                    vendor_id NUMBER(5));


ALTER TABLE employees
ADD CONSTRAINT dep_id FOREIGN KEY(department_id) REFERENCES departments(department_id);

ALTER TABLE employees
ADD CONSTRAINT j_id FOREIGN KEY(job_id) REFERENCES jobs(job_id);

ALTER TABLE employee_phone
ADD CONSTRAINT e_pn_id FOREIGN KEY(employee_id) REFERENCES employees(employee_id);

ALTER TABLE items
ADD CONSTRAINT itms FOREIGN KEY(employee_id) REFERENCES employees(employee_id);

ALTER TABLE vendor_phone
ADD CONSTRAINT v_pn_id FOREIGN KEY(vendor_id) REFERENCES vendors(vendor_id);

ALTER TABLE orders
ADD CONSTRAINT odr_id FOREIGN KEY(employee_id) REFERENCES employees(employee_id);

ALTER TABLE shift
ADD CONSTRAINT sft_id FOREIGN KEY(employee_id) REFERENCES employees(employee_id);

ALTER TABLE orders
ADD CONSTRAINT cust_ord FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

ALTER TABLE items
ADD CONSTRAINT itm_ord FOREIGN KEY(order_id) REFERENCES orders(order_id);

ALTER TABLE store
ADD CONSTRAINT itmm_id FOREIGN KEY(item_id) REFERENCES items(item_id);

ALTER TABLE store
ADD CONSTRAINT ven_id FOREIGN KEY(vendor_id)REFERENCES vendors(vendor_id);

ALTER TABLE employees
ADD CONSTRAINT unique_employee_department UNIQUE (email, SSN);

ALTER TABLE store
ADD CONSTRAINT pk_store PRIMARY KEY (item_id, item_name)