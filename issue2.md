## Issue 2

In case of backup issue;

1. I would try to get detailed information about the issue from the first line of customer support:
- What is the error that the customer get?
- How many users facing the issue? Is it specific for a single customer?
- Does the customer have automated backups or is there exist a recent backup before the issue?

2. I would try to understand the problem using the information by trying to reproduce it. I would check the health and logs of the dashboard app and backup app if it is a seperate application.

3. After investigation, according to results, the following may be check:
- Is there any connectivity issue to backup location?
- If the backup location a server, is there enough space on filesystem or any problem with external storage?

4. If the issue is cannot be fixed after checking, I would try to manually backup if it is for a single customer. If there exist a general problem, I would try to automate the by writing a script for all custormers temporarily. 

5. If it is a problem related with the application like a bug etc., I would report the issue to the developer team.