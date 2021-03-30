SELECT day, count(assignments.id), sum(duration)
FROM assignments
GROUP BY day
ORDER BY day;