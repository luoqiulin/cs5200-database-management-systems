/* Student, Qiulin Luo -- CS5200-05, Fall 2021 */
/* Q1 */
SELECT COUNT(*) FROM Worker
WHERE department = 'HR' AND salary > 250000;
/* Q2 */
SELECT DISTINCT last_name,worker_title,department FROM Worker INNER JOIN Title
ON worker_id = worker_ref_id AND salary < (SELECT AVG(salary) FROM Worker);
/* Q3 */
SELECT DISTINCT department, AVG(salary) AS AvgSal, COUNT(*) AS Num FROM Worker
GROUP BY department;
/* Q4 */
SELECT DISTINCT first_name, last_name, ROUND(salary/12) AS MonthlyComp, worker_title FROM Worker, Title
WHERE worker_id = worker_ref_id;
/* Q5 */
SELECT DISTINCT UPPER(first_name || ' ' || last_name) AS FULL_NAME  
FROM Worker 
WHERE worker_id NOT IN (SELECT worker_ref_id FROM Bonus);
/* Q6 */
SELECT DISTINCT first_name || ' ' || last_name AS FULL_NAME
FROM Worker
WHERE worker_id IN (SELECT worker_ref_id FROM Title WHERE worker_title LIKE '%Manager%');