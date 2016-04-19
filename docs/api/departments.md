# Department

Represent a specific group within a college. For example, the Mathematics
Department. Departments can also be viewed as subjects.

GET `/api/departments`

Return information on all departments for a specific school.

GET `/api/departments/:id`

Return information on a specific department.

```
Url Parameters

id (required) - the database id for the department
```

GET `/api/department/:id/courses`

Return the courses that are associated with a specific department.

```
Url Parameters

id (required) - the database id for the department
```

GET `/api/schools/:id/departments/search`

Search for departments at a specific school.

```
Request Body Parameters

term (required) - the term to search
school_id (optional) - limit your search to a specific school id
```
