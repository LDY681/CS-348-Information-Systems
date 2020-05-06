-- Query 1
SELECT DISTINCT s.s_id as "S_ID", s.name as "Name" FROM student s
JOIN takes ta ON ta.s_id = s.s_id
JOIN teaches te ON (te.course_id = ta.course_id and te.sec_id = ta.sec_id and te.semester = ta.semester and te.year = ta.year)
JOIN instructor i ON i.i_id = te.i_id
WHERE i.name = 'Katz'
ORDER BY s.name asc;
-- Query 2
SELECT takes.s_ID, (avg)grade_points.points FROM takes
JOIN grade_points ON grade_points.grade = takes.grade
GROUP BY takes.s_id
ORDER BY (avg)grade_points.points;
-- Query 3

-- Query 4

-- Query 5

-- Query 6

-- Query 7

-- Query 8

-- Query 9

-- Query 10
