SELECT count(assistance_requests.*), students.name as student
FROM assistance_requests
join students 
ON assistance_requests.student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY student;

