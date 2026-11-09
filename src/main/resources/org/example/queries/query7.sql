7. Find all pairs of students who have taken at least three courses in common. For each
pair, list both students’ full names (as two columns, each pair listed only once), the
number of courses they have in common, and each student’s average grade across those
shared courses.

COPY(
    SELECT s1.firstName AS firstName1, s1.lastName AS lastName1,
           s2.firstName AS firstName2, s2.lastName AS lastName2,
    
)