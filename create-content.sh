#!/bin/bash
set -x

myteacher=$(moosh user-create --password pass --city Bochum --country DE --email me49@example.com --firstname "test" --lastname "teacher" testteacher)
mystudent=$(moosh  user-create --password pass --city Bochum --country DE --email moosh49@example.com --firstname "test" --lastname "student" teststudent)
courseid=$(moosh  course-create --category 1 --fullname "MooshCourse1" --description "My first moosh-course"  mooshtestkurs)
moosh course-enrol -r editingteacher -i "$courseid" "$myteacher"
moosh course-enrol "$courseid" teststudent
moosh activity-add --name "The first forum" forum "$courseid"
moosh activity-add --name "The first lesson" lesson "$courseid"
moosh activity-add --name "Easy assignment" assign "$courseid"
moosh activity-add --name 'my quiz' quiz "$courseid"


