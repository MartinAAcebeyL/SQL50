-- url: https://leetcode.com/problems/department-top-three-salaries/description/?envType=study-plan-v2&envId=top-sql-50
WITH RankedSalaries AS (
    SELECT 
        E.name AS Employee,
        E.salary AS Salary,
        D.name AS Department,
        DENSE_RANK() OVER(PARTITION BY E.departmentId ORDER BY E.salary DESC) AS DenseRank
    FROM Employee E
    JOIN Department D ON E.departmentId = D.id
)

SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE DenseRank <= 3;
