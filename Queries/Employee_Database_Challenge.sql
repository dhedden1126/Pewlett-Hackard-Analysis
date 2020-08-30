-- Joining 2 tables
SELECT e.emp_no,
     e.first_name,
     e.last_name,
     ti.title,
	 ti.from_date,
	 ti.to_date
INTO retiring_employees
FROM employees as e 
Right JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retiring_employees

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no, re.first_name,
	re.last_name,
	re.title
INTO dups_removed
FROM retiring_employees as re
ORDER BY emp_no, to_date ASC;

SELECT * FROM dups_removed

-- Retrieve # of employees
SELECT count(dr.title)
FROM dups_removed as dr
-- ORDER BY dr.title DESC;

DROP TABLE retiring_titles
-- Create table
SELECT DISTINCT COUNT(dr.title), dr. title
-- INTO retiring_titles
FROM dups_removed as dr
GROUP BY dr.title
ORDER BY count DESC;

-- Mentorship Program Eligibility
SELECT DISTINCT ON (e.emp_no)
	 e.emp_no,
     e.first_name,
     e.last_name,
	 e.birth_date,
	 de.from_date,
	 de.to_date,
	 ti.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de. emp_no
INNER JOIN titles as ti
ON e.emp_no = ti. emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date <= '9999-01-01')
ORDER BY emp_no;


