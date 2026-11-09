COPY(
    SELECT Count(studentId) AS numStudents
    FROM transcript 
    WHERE grade >= 80 AND courseId = 'mie301h1f'
)

TO 'src/main/resources/data/output/query1.csv';