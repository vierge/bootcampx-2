const { Pool } = require('pg');
const args = process.argv.slice(2);

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
  SELECT students.id, students.name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name LIKE '%${args[0]}%'
  LIMIT ${args[1]};
`)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.name} has an id of ${row.id} and was in the ${row.cohort_name} cohort!`);
  });
})
.catch(err => console.error('query error', err.stack));