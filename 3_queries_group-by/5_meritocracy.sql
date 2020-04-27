-- queries students with low average completion times

SELECT students.name AS student_name,
  avg(assignment_submissions.duration) AS average_completion_time,
  avg(assignments.duration) AS average_estimated_completion_time
FROM assignment_submissions
JOIN assignments ON assignment_id = assignments.id
JOIN students ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_completion_time ASC; 