SELECT students.name as student, avg(assignment_submissions.duration) as studentAvg, avg(assignments.duration) as assignmentAvg
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments  ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING avg(assignments.duration) > avg(assignment_submissions.duration)
ORDER BY studentAvg ASC