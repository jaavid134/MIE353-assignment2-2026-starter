COPY(
    SELECT courseName
    FROM course
    WHERE courseId LIKE '___4%'
)
TO 'src/main/resources/data/output/query2.csv';