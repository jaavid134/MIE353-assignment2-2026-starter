
COPY(
    SELECT CONCAT(firstName, ' ', lastName) AS fullName 
    FROM professor, teaches
    WHERE professor.profId = teaches.profId
    GROUP BY professor.profId, firstName, lastName
    HAVING COUNT(teaches.courseId) = 1
)
TO 'src/main/resources/data/output/query3.csv';