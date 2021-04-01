const { Pool} = require('pg');

const cohort = process.argv[2];

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database:'bootcampx'
});

pool.query(`
  SELECT DISTINCT ON (teacher) teachers.name as teacher, cohorts.name as cohort
  FROM assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name = $1
  ORDER BY teacher;`, [cohort])
  .then(
    res => {
      res.rows.forEach((teacher) => {
        console.log(teacher.cohort, teacher.teacher)
      })
    }
  )
