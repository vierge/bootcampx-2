SELECT students.name AS student_name,
  sum(assignment_submissions.duration) AS total_duration
FROM assignment_submissions
JOIN students ON student_id = students.id
WHERE students.name = 'Ibrahim Schimmel'
GROUP BY students.name;