SELECT cohorts.name AS cohort_name,
  sum(assignment_submissions.duration) AS total_duration
FROM assignment_submissions

-- here we need to take two steps to
-- link the cohort name with the assignment. RELATIONSHIPS

JOIN students ON student_id = students.id -- assignments are submitted by students....
JOIN cohorts ON cohort_id = cohorts.id  -- students belong to a cohort...
WHERE cohorts.name = 'FEB12'
GROUP BY cohorts.name;