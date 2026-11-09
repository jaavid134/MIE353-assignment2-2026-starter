COPY (
SELECT courseId, courseName
From course
WHERE gradCourse = 1 OR gradCourse = 2
)
TO 'src/main/resources/data/output/gradCourses.csv';

