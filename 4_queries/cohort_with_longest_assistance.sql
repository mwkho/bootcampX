SELECT cohorts.name as cohort, avg(assistance_requests.completed_at - assistance_requests.started_at)as avg_duration
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY cohort
ORDER BY avg_duration DESC
LIMIT 1;