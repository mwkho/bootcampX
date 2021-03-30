SELECT assignments.id as assignment, assignments.day as day, assignments.chapter as chapter, assignments.name as name, count(assistance_requests.id) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assistance_requests.assignment_id
GROUP BY assignment
ORDER BY total_requests DESC;