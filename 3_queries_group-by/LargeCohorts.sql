SELECT cohorts.name, count(students.name) as size
FROM cohorts
JOIN students
ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING count(students.name) > 18
ORDER BY size