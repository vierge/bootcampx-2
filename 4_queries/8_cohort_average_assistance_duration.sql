SELECT avg(total_duration) AS average_total_duration FROM (
  SELECT sum(completed_at - started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.id
) AS sub;