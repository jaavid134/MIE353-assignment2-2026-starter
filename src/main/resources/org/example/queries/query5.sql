
COPY(
    SELECT CONCAT(firstName, ' ', lastName) AS fullName 
    FROM professor, teaches, transcript
    WHERE professor.profId = teaches.profId
    AND teaches.courseId = transcript.courseId
    GROUP BY professor.profId, professor.firstName, professor.lastName
    HAVING MIN(transcript.grade) > 49
)
TO 'src/main/resources/data/output/query5.csv';