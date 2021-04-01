const { Pool} = require('pg');

const month = process.argv[2];
const limit = process.argv[3];


const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database:'bootcampx'
});

pool.query(`
SELECT students.id as id , students.name as name, cohorts.name as cohort
FROM students 
JOIN cohorts on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${month}%'
LIMIT ${limit};`)
  .then( res => {
    res.rows.forEach ((student) => {
      console.log(student.name, 'has id of ', student.id, 'and in cohort ', student.cohort)
    })
    
  })
  .catch(err =>  console.error('query error', err.stack));