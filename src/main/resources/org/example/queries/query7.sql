
COPY(
        SELECT CONCAT(s1.firstName, ' ', s1.lastName) AS student1FullName,
                        CONCAT(s2.firstName, ' ', s2.lastName) AS student2FullName,
                        COUNT(*) AS commonCoursesCount,
                        ROUND(AVG(t1.grade), 2) AS student1AvgGrade,
                        ROUND(AVG(t2.grade), 2) AS student2AvgGrade
        FROM student s1, transcript t1, transcript t2, student s2 
        WHERE s1.studentId = t1.studentId 
        AND s2.studentId = t2.studentId 
        AND t1.courseId = t2.courseId
        AND s1.studentId < s2.studentId
        GROUP BY s1.studentId, s2.studentId, s1.firstName, s1.lastName, s2.firstName, s2.lastName
        HAVING COUNT(*) >= 3
)
TO 'src/main/resources/data/output/query7.csv';