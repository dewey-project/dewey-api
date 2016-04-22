# Schools

GET `/api/schools`

Get information on all schools

GET `/api/schools/search`

Search for schools

GET `/api/schools/:id`

Get information on a specific school

# Departments

GET `/api/schools/:id/departments`

Get all the departments for a specific school

GET `/api/schools/:id/departments/search`

Search for departments that belong to a specific
school

GET `/api/departments/:id`

Get information on a specific department

# Courses

GET `/api/departments/:id/courses`

Get information on courses for a specific department

GET `/api/courses/:id/prerequisites`

Get prerequisites for a specific course

GET `/api/courses/:id/prerequisites/graph`

Get prerequisite graph for a specific course

GET `/api/departments/:id/courses/search`

Search for courses within a specific department

GET `/api/courses/:id`

Get information for a specific course

# Admin Schools

POST `/api/admin/schools`

PUT `/api/admin/schools/:id`

PATCH `/api/admin/schools/:id`

DELETE `/api/admin/schools/:id`

# Admin Departments

POST `/api/admin/schools/:id/departments`

PUT `/api/admin/departments/:id`

PATCH `/api/admin/departments/:id`

DELETE `/api/admin/departments/:id`

# Admin Courses

POST `/api/admin/departments/:id/courses`

POST `/api/admin/courses/:id/prerequisites`

DELETE `/api/admin/courses/:id/prerequisites/:id`

PUT `/api/admin/courses/:id`

PATCH `/api/admin/courses/:id`

DELETE `/api/admin/courses/:id`
