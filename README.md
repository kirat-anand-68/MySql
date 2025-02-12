# MySQL Database README

## Overview
This project is a MySQL database that serves as the backend for managing employee and department data. It includes tables for storing information about employees, departments, and their relationships, along with the necessary SQL queries for data manipulation and retrieval.

## Features
- Store and manage employee data, including employee numbers, names, and birthdates.
- Track department details such as department numbers and names.
- Record and manage relationships between employees and departments, including contract start dates.
- Query examples provided for common database operations.

## Database Schema
The database consists of the following tables as shown below

### 1. `employees`
| Column       | Type         | Description                           |
|--------------|--------------|---------------------------------------|
| `emp_no`     | INT          | Employee number (Primary Key)         |
| `first_name` | VARCHAR(50)  | First name of the employee            |
| `last_name`  | VARCHAR(50)  | Last name of the employee             |
| `birth_date` | DATE         | Birthdate of the employee             |

### 2. `departments`
| Column      | Type         | Description                           |
|-------------|--------------|---------------------------------------|
| `dept_no`   | CHAR(4)      | Department number (Primary Key)       |
| `dept_name` | VARCHAR(50)  | Name of the department                |

### 3. `dept_emp`
| Column      | Type         | Description                           |
|-------------|--------------|---------------------------------------|
| `emp_no`    | INT          | Employee number (Foreign Key)         |
| `dept_no`   | CHAR(4)      | Department number (Foreign Key)       |
| `from_date` | DATE         | Start date of the employee's contract |
| `to_date`   | DATE         | End date of the employee's contract   |

## Example Queries

### 1. Retrieve All Employee Details
```sql
SELECT * FROM employees;
```

### 2. Retrieve Employee Numbers, Start Dates, and Department Names
```sql
SELECT
    de.emp_no,
    de.from_date,
    d.dept_name
FROM
    dept_emp AS de
INNER JOIN
    departments AS d
ON
    de.dept_no = d.dept_no;
```

### 3. Add a New Employee
```sql
INSERT INTO employees (emp_no, first_name, last_name, birth_date)
VALUES (101, 'John', 'Doe', '1990-01-01');
```

### 4. Delete Records for a Specific Department
```sql
DELETE FROM dept_emp
WHERE dept_no = '5';
```

### 5. Update Employee Name
```sql
UPDATE employees
SET first_name = 'Jane'
WHERE emp_no = 101;
```

## How to Use

1. **Set Up the Database:**
   - Create a MySQL database using the schema provided above.
   - Populate the tables with sample data or import existing data.

2. **Run Queries:**
   - Use the SQL examples provided to interact with the database.
   - Modify the queries as needed to suit your specific requirements.

3. **Integrate with Applications:**
   - Connect this database to your application using a MySQL client or library.
   - Use the queries as part of your backend logic to retrieve and manipulate data.

## Contributing
Contributions are welcome! If you'd like to improve this database schema or add more features, feel free to fork the repository and submit a pull request.

## License
This project is licensed under the [MIT License](LICENSE).

---

Feel free to contact me if you have any questions or need assistance with this project.

