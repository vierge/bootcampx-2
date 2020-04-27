SELECT students.name AS student_name,
  avg(assignment_submissions.duration) AS avg_completion_time
FROM assignment_submissions
JOIN students on student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student_name
ORDER BY avg_completion_time DESC;
