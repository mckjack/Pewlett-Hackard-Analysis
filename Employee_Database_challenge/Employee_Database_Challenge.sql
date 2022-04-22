-- DELIVERABLE 1
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	ti.title,
	ti.from_date,
	ti.to_date
INTO Retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no);

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(emp_no) 
	emp_no,
	first_name, 
	last_name,
	title
INTO unique_titles
FROM retirement_titles 
WHERE retirement_titles.to_date = ('9999-01-01')
ORDER BY retirement_titles.emp_no , retirement_titles.to_date  DESC;

-- Retiring titles
SELECT COUNT(un.title) , un.title
INTO retiring_titles
FROM unique_titles as un
GROUP BY un.title
ORDER BY COUNT(un.title) DESC;

-- Deliverable 2
SELECT DISTINCT ON(emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti 
	ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;