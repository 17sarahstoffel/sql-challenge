-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_id" VARCHAR(225)   NOT NULL,
    "dept_name" VARCHAR(225)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_id"
     )
);

CREATE TABLE "dept_emp" (
    "emp_id" INTEGER   NOT NULL,
    "dept_id" VARCHAR(225)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_id","dept_id"
     )
);

CREATE TABLE "dept_manager" (
    "dept_id" VARCHAR(225)   NOT NULL,
    "emp_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_id","emp_id"
     )
);

CREATE TABLE "employees" (
    "emp_id" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(225)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(225)   NOT NULL,
    "last_name" VARCHAR(225)   NOT NULL,
    "sex" VARCHAR(225)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "salaries" (
    "emp_id" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "titles" (
    "emp_title_id" VARCHAR(225)   NOT NULL,
    "title" VARCHAR(225)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "departments" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("emp_title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employees" ("emp_id");

