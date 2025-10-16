Create two users:
CREATE USER C##user1 IDENTIFIED BY 1234;
CREATE USER C##user2 IDENTIFIED BY 1234;
Grant them minimal access to connect and create objects:
GRANT CONNECT, RESOURCE TO C##user1;
GRANT INSERT ON emp TO c##user1;
GRANT CONNECT TO c##user2;
Example 1 — Granting Object Privileges
Login as C##user1:
Create a sample table:
CREATE TABLE emp2 (
  emp_id NUMBER PRIMARY KEY,
  emp_name VARCHAR2(50),
  salary NUMBER
);

INSERT INTO emp2 VALUES (101, 'Alice', 50000);
INSERT INTO emp2 VALUES (102, 'Bob', 60000);
COMMIT;
Now, userA grants SELECT privilege on this table to C##user2:
GRANT SELECT ON emp TO C##user2;
Result:
user2 can now view user1’s table data.
Login as user2 and run:
SELECT * FROM user1.emp;
You’ll see the rows from emp.

Example 2 — Granting Multiple Privileges
User1 can also grant more than one privilege at once:
GRANT SELECT, INSERT, UPDATE ON emp1 TO C##user2;
Now user2 can insert or update rows in user1.emp.
Example (as user2):
INSERT INTO user1.emp VALUES (103, 'Charlie', 70000);
COMMIT;

Example 3 — Granting with GRANT OPTION
If you want user2 to be able to grant the same privilege to others:
GRANT SELECT ON emp TO user2 WITH GRANT OPTION;
Now, user2 can give SELECT privilege on user1.emp to another user (say user3):
GRANT SELECT ON userA.emp TO user3;

Example 4 — Revoking Privileges
If you want to remove privileges:
REVOKE SELECT, INSERT, UPDATE ON emp FROM user2;
Result:
user2 can no longer query or modify user1.emp.
If the privilege was granted WITH GRANT OPTION, revoking it from userB also removes it from anyone userB had granted it to (like userC).



Example 5 — System Privileges
As SYSTEM or DBA, you can grant system-wide privileges.
Example:
GRANT CREATE TABLE TO user2;
Now user2 can create tables in their own schema.
To remove that ability:
REVOKE CREATE TABLE FROM user2;
