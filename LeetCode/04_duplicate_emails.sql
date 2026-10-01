/*
Question: Duplicate Emails
URL: https://leetcode.com/problems/duplicate-emails/description/

Description:
Report all the duplicate emails in the Person table. Note that all emails are guaranteed to be in lowercase.

Table: Person
Columns: id (INT), email (VARCHAR)
*/

SELECT Email
FROM 
(SELECT Email, COUNT(Email) AS CNT
FROM Person
GROUP BY Email)
WHERE CNT > 1


SELECT Email, COUNT(1) AS ct
FROM Person
GROUP BY 1
HAVING ct > 1


select email as Email from Person group by email having count(email)>1

/*
Explanation:
1. Groups records by email: GROUP BY email.
2. Filters groups having more than one occurrence: HAVING COUNT(email) > 1.
3. Selects email AS Email.
*/