SELECT students.name as student, avg(assignment_submissions.duration) as averages
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY averages DESC;