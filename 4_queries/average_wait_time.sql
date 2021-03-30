SELECT avg(assistance_requests.started_at - assistance_requests.created_at) as avg_wait
FROM assistance_requests;