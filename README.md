# ST4015CMD - Foundation of Computer Science
## BSc (Hons) Ethical Hacking & Cybersecurity
### Softwarica College of IT & E-Commerce
### In Collaboration with Coventry University

---

## Assignment
**Title:** Investigation and Analysis of Computing Data for Data Management
**Module Code:** ST4015CMD
**GitHub:** https://github.com/astrix0x/foundations_of_cs

---

## Repository Structure
```
foundations_of_cs/
├── task1/
│   ├── task1_encoding.py
│   ├── output.png
│   └── README.md
├── task2/
│   ├── task2_factorial.py
│   ├── output.png
│   └── README.md
└── task3/
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

## Tasks Overview

### Task 1 - Encoding Formats and Secure Data Exchange
Explores encoding formats such as Base64 and URL encoding 
and how they work with secure protocols like HTTPS and TLS.

- Script: task1/task1_encoding.py
- Read more: [Task 1 README](task1/README.md)

### Task 2 - P vs NP and Seating Arrangement Problem
Demonstrates computational complexity using a classroom 
seating scenario. Shows factorial growth and heuristic approach.

- Script: task2/task2_factorial.py
- Read more: [Task 2 README](task2/README.md)

### Task 3 - Database Normalisation and SQL
Demonstrates normalisation from UNF to 3NF using a college 
club membership database. Includes ER diagram, SQL operations 
and JOIN queries.

- SQL: task3/sql/schema.sql
- Read more: [Task 3 README](task3/README.md)

---

## How to Run

### Task 1 and Task 2 (Python Scripts)

Make sure Python 3 is installed:
```bash
python3 --version
```

Clone the repository:
```bash
git clone https://github.com/astrix0x/foundations_of_cs.git
cd foundations_of_cs
```

Run Task 1:
```bash
cd task1
python3 task1_encoding.py
```

Run Task 2:
```bash
cd task2
python3 task2_factorial.py
```

### Task 3 (Docker and MySQL)

Make sure Docker and Docker Compose are installed:
```bash
docker --version
docker-compose --version
```

Run Task 3:
```bash
cd task3/sql
docker-compose up -d
```

Check tables:
```bash
docker exec -it mysql-task mysql -u root -proot \
-e "USE college_club; SHOW TABLES;"
```

Stop the container:
```bash
docker-compose down
```

---

## Tools Used

| Tool | Purpose |
|---|---|
| Python 3 | Task 1 and Task 2 scripts |
| MySQL 9.6.0 | Task 3 database |
| Docker | Task 3 containerisation |
| Docker Compose | Task 3 container management |
| Kali Linux | Development environment |
| app.diagrams.net | ER Diagram |
| Google Sheets | Factorial growth chart |

---

## Reflection

This repository contains all practical work for the ST4015CMD 
module. Each task demonstrates a key area of computer science:
encoding and secure communication, computational complexity, 
and database design. All scripts and SQL files have been tested 
and verified on Kali Linux using Docker.

---

## Author 
> **Aashish Acharya** ([@astrix0x](https://github.com/astrix0x))
> First Year BSc (Hons) Ethical Hacking & Cybersecurity
> Softwarica College of IT & E-Commerce
> In Collaboration with Coventry University
