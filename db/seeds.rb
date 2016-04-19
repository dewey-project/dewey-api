# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).

lonestar = School.create(title: 'Lonestar College')
tech = School.create(title: 'Texas Tech')

lonestar_math = Department.create(title: 'Mathematics',
                         abbreviation: 'MATH',
                         school: lonestar)

tech_math = Department.create(title: 'Mathematics',
                         abbreviation: 'MATH',
                         school: tech)

Course.create(title: 'College Algebra',
              code: 1314,
              credits: 3,
              department: lonestar_math)

Course.create(title: 'Trigonometry',
              code: '1316',
              credits: 3,
              department: lonestar_math)

Course.create(title: 'College Algebra',
              code: 1314,
              credits: 3,
              department: tech_math)

Course.create(title: 'Trigonometry',
              code: '1316',
              credits: 3,
              department: tech_math)
