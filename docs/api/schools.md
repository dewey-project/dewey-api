# Schools

A school represents a specific college, its departments and the courses
that it offers.

GET `/api/schools`

Return information on all the schools that are in the dewey-api.

GET `/api/schools/:id`

Return information for a specific school in the dewey-api.

```
Url Parameters

id (required) - The database id for the school
```

GET `/api/schools/:id/courses`

Return information on the courses that a school offers.

```
Url Parameters

id (required) - The database id for the school
```

GET `/api/schools/search`

Search for schools based on their title

```
Request Body Parameters

term (required) - the term to search
```
