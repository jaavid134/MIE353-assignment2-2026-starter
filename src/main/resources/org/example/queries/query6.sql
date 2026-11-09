
COPY(
    SELECT DISTINCT CONCAT(firstName, ' ', lastName) AS fullName 
    FROM student, transcript, course
    WHERE (student.studentId = transcript.studentId
    AND transcript.courseId = course.courseId
    AND NOT (course.courseName = 'Data Modelling')
    AND transcript.grade >= 90) 
    AND student.studentId IN (SELECT student.studentId
    FROM student, transcript, course
    WHERE student.studentId = transcript.studentId
    AND transcript.courseId = course.courseId
    AND (course.courseName = 'Data Modelling'))
)
TO 'src/main/resources/data/output/query6.csv';