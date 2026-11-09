
COPY(
    SELECT DISTINCT CONCAT(professor.firstName, ' ', professor.lastName) AS fullName 
    FROM professor, teaches, transcript, student
    WHERE professor.profId = teaches.profId
    AND teaches.courseId = transcript.courseId
    AND transcript.studentId = student.studentId
    AND student.firstName = 'Rebecca'
    AND student.lastName = 'Ward'
)
TO 'src/main/resources/data/output/query4.csv';