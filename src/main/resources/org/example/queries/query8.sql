
COPY(
WITH student_courses AS (
    SELECT s.studentId, t.courseId, SUBSTRING(courseId, 1, 3) AS department, CAST(regexp_extract(t.courseId, '\d+') AS INT) AS courseNumber, t.grade
    FROM student s, transcript t
    WHERE s.studentId = t.studentId),
    grades AS (
    SELECT studentId, department, courseNumber, arg_max(courseId, grade) AS courseId, MAX(grade) AS grade
    FROM student_courses
    GROUP BY studentId, department, courseNumber
    )

SELECT CONCAT(st.firstName, ' ', st.lastName) AS fullName,
       g.department,
       CONCAT( arg_min(g.courseId, g.courseNumber), ', ', arg_max(g.courseId, g.courseNumber) ) AS coursePair,
       CONCAT( arg_min(g.grade, g.courseNumber), ', ', arg_max(g.grade, g.courseNumber) ) AS gradePair
FROM grades g, student st
WHERE g.studentId = st.studentId 
GROUP BY st.studentId, st.firstName, st.lastName, g.department
HAVING COUNT(DISTINCT g.courseNumber) >= 2
) TO 'src/main/resources/data/output/query8.csv';