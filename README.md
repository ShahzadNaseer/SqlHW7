### SqlHW7 - Postgres Sql - Assignment 7 for Week 9
# Employee Database: A Mystery in Two Parts

## Background

In this assignment, we will design the SQL tables to hold data that is given in the CSVs, import the CSVs into a SQL database, and answer questions about the data. 

In other words, we will perform:

1. Data Modeling

2. Data Engineering

3. Data Analysis

#### Data Modeling

Table scripts are created after looking the CSVs files and data. Table names are same as CSV file name. 
ERD was created using Microsoft  Sql Server Management Studio.

#### Data Engineering

* Tables were created using scripts in Postgres database

* Data from CSV files were imported into corresponding SQL table.

#### Data Analysis

Query file is included to asnwer following questions.

1. List the following details of each employee: employee number, last name, first name, gender, and salary.

2. List employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List all employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

### Bonus

Draw bar graph in Jupyter Notebook using sqlalchemy and matplotlib.

### Extra Study

Did further analysis of average salaries of Male vs Female. Results of this analysis is worth looking.

![Imgur Image](https://github.com/ShahzadNaseer/SqlHW7/blob/master/GenderAvgSalaryComparison.png)
