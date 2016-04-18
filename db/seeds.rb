# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).

school = School.create(title: 'Lonestar College')

math = Department.create(title: 'Mathematics',
                         abbreviation: 'MATH',
                         school: school)

Course.create(title: 'College Algebra',
              code: 1314,
              credits: 3,
              department: math)

Course.create(title: 'Trigonometry',
              code: '1316',
              credits: 3,
              department: math)
