# Task 3 - Database Normalisation and SQL
## ST4015CMD Foundation of Computer Science
### BSc (Hons) Ethical Hacking & Cybersecurity

---

## Objective

This task demonstrates the process of database normalisation 
using a college club membership scenario. The goal is to take 
a poorly designed unnormalised table and progressively normalise 
it through First Normal Form (1NF), Second Normal Form (2NF), 
and Third Normal Form (3NF). An Entity Relationship (ER) diagram 
is created to visualise the final database structure. Basic SQL 
operations and JOIN queries are also demonstrated.

---

### Prerequisites
Make sure you have these installed:
- Git
- Docker
- Docker Compose

### Clone the Repository
```bash
git clone https://github.com/astrix0x/foundations_of_cs.git
```

Navigate to task3:
```bash
cd foundations_of_cs/task3/sql
```

## Folder Structure
```
task3/
├── er diagram and images/
│   ├── unormal_table.png
│   ├── 1NF_primaryKeys.png
│   ├── student_club_membership_2NF_Tables.png
│   ├── club_membership_3NF_Tables.png
│   ├── add_new_Student_and_club.png
│   ├── joined_tables.png
│   ├── total_tables_at_end.png
│   └── er-diagram.png
├── sql/
│   ├── schema.sql
│   ├── task3_dump.sql
│   ├── Dockerfile
│   └── docker-compose.yml
├── output.txt
└── README.md
```

---

## Database Overview

The original unnormalised table stored all college club 
membership information in one single table which caused:

- Redundant data
- No reliable primary key
- Insert, Update and Deletion anomalies

The table was then normalised step by step into a clean 
and reliable database structure.

---

## Normalisation Steps

### Unnormalised Form (UNF)
- Single table with all data mixed together
- Student details, club details and membership details 
  all in one place

![Unnormalised Table](er%20diagram%20and%20images/unormal_table.png)

---

### First Normal Form (1NF)
- All cells contain single atomic values
- Composite primary key added: (StudentID, ClubName)
- Each row is now uniquely identifiable

![1NF Primary Keys](er%20diagram%20and%20images/1NF_primaryKeys.png)

---

### Second Normal Form (2NF)
- Partial dependencies removed
- Table split into 3 separate tables:
  - Student_2NF (StudentID, StudentName, Email)
  - Club_2NF (ClubName, ClubRoom, ClubMentor)
  - Membership_2NF (StudentID, ClubName, JoinDate)

![2NF Tables](er%20diagram%20and%20images/student_club_membership_2NF_Tables.png)

---

### Third Normal Form (3NF)
- Transitive dependencies removed
- ClubID introduced as stable numeric primary key
- Updated tables:
  - Club_3NF (ClubID, ClubName, ClubRoom, ClubMentor)
  - Membership_3NF (StudentID, ClubID, JoinDate)

![3NF Tables](er%20diagram%20and%20images/club_membership_3NF_Tables.png)

---

## ER Diagram

The ER diagram shows three entities and their relationships:

- **Student** (StudentID PK, StudentName, Email)
- **Club** (ClubID PK, ClubName, ClubRoom, ClubMentor)
- **Membership** (StudentID FK, ClubID FK, JoinDate)

Relationships:
- One Student can join Many clubs (1 to M)
- One Club can have Many students (1 to M)

![ER Diagram](er%20diagram%20and%20images/er-diagram.png)

---

## SQL Operations

### Insert and Select Queries
- Inserted new student Priya (StudentID 8)
- Inserted new club Art Club (ClubID C05)
- Displayed all students and clubs

![Insert and Select](er%20diagram%20and%20images/add_new_Student_and_club.png)

---

### JOIN Query
Combines Student_2NF, Club_3NF and Membership_3NF
to display StudentName, ClubName and JoinDate together

![Join Result](er%20diagram%20and%20images/joined_tables.png)

---

### All Final Tables
![All Tables](er%20diagram%20and%20images/total_tables_at_end.png)

---

### Tables Created
| Table | Description |
|---|---|
| ClubMembership | Original unnormalised table |
| ClubMembership_1NF | Table in First Normal Form |
| Student_2NF | Student table in Second Normal Form |
| Club_2NF | Club table in Second Normal Form |
| Membership_2NF | Membership table in Second Normal Form |
| Club_3NF | Club table in Third Normal Form |
| Membership_3NF | Membership table in Third Normal Form |

Full query output available in: output.txt

---

## How to Run

### Option 1 - Docker Compose (Recommended)

Make sure Docker and Docker Compose are installed, then:
```bash
cd task3/sql
docker-compose up -d
```

Check tables:
```bash
docker exec -it mysql-task mysql -u root -proot \
-e "USE college_club; SHOW TABLES;"
```

Run JOIN query:
```bash
docker exec -it mysql-task mysql -u root -proot -e "
USE college_club;
SELECT Student_2NF.StudentName, Club_3NF.ClubName, 
Membership_3NF.JoinDate
FROM Membership_3NF
JOIN Student_2NF 
ON Membership_3NF.StudentID = Student_2NF.StudentID
JOIN Club_3NF 
ON Membership_3NF.ClubID = Club_3NF.ClubID;"
```

Stop the container:
```bash
docker-compose down
```

### Option 2 - Manual Docker
```bash
docker pull mysql
docker run --name mysql-task \
-e MYSQL_ROOT_PASSWORD=root \
-e MYSQL_DATABASE=college_club \
-d mysql

docker exec -i mysql-task mysql \
-u root -proot college_club < schema.sql
```

### Option 3 - Local MySQL
```bash
mysql -u root -p < schema.sql
```

---

## Expected Output

After running the setup you should see 7 tables:
```
+------------------------+
| Tables_in_college_club |
+------------------------+
| ClubMembership         |
| ClubMembership_1NF     |
| Club_2NF               |
| Club_3NF               |
| Membership_2NF         |
| Membership_3NF         |
| Student_2NF            |
+------------------------+
```

Full expected output is available in output.txt

---

## Reflection

This task demonstrated how normalisation removes redundancy 
and improves data integrity. Splitting one poorly designed 
table into three clean tables eliminated all anomalies and 
made the data much easier to manage. The use of Docker 
allowed practical implementation of the database in a 
real environment, and the JOIN query showed how normalised 
tables can still be combined to retrieve meaningful information.

---

## Tools Used

- MySQL 9.6.0
- Docker
- Docker Compose
- Kali Linux
- app.diagrams.net (ER Diagram)
