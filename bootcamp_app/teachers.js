const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${args[0]}'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher ASC;
`)
.then(res => {
  res.rows.forEach(teachers => {
    console.log(`${teachers.cohort}: ${teachers.teacher}`);
  })
})
.catch(err => {
  console.error('query error', err.stack);
});