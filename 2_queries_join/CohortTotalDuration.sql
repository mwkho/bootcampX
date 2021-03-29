SELECT sum(duration)
FROM assignment_submissions 
JOIN students
ON student_id = students.id
WHERE student_id IN (
  SELECT students.id
  FROM students 
  INNER JOIN cohorts 
    ON cohorts.id = students.cohort_id
  WHERE cohorts.name = 'FEB12'
  );