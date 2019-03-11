USE school_sport_clubs;

select students.name, sports.name from students
join sports on sports.id in 
(select sport_id from sportGroups where sportGroups.id in
(select sportGroup_id from student_sport where student_id = students.id));

select location, sports.name from sportGroups
join sports on sportGroups.sport_id=sports.id;

select location, sports.name from sportGroups
left join sports on sportGroups.sport_id=sports.id;

select location, sports.name from sportGroups
right join sports on sportGroups.sport_id=sports.id;

(select location, sports.name from sportGroups
left join sports on sportGroups.sport_id=sports.id)
union all
(select location, sports.name from sportGroups
right join sports on sportGroups.sport_id=sports.id);

select students.name, sportGroups.id from sportGroups 
join students on students.id in
(select student_id from student_sport where student_id=students.id)
where sportGroups.dayOfWeek='Sunday';

select students.name, sports.name, sportGroups.location, coaches.name from sportGroups 
join students on students.id in
(select student_id from student_sport where student_id=students.id)
join sports on sports.id in
(select sport_id from sportGroups where sportGroups.id in
(select sportGroup_id from student_sport where student_id=students.id
))
join coaches on sportGroups.coach_id=coaches.id
where sportGroups.dayOfWeek='Monday' and coaches.name like '%todorov petkov%';

select students.name, students.class, sports.name from students
join sports on sports.id in
(select sport_id from sportGroups where sportGroups.id in
(select sportGroup_id from student_sport where student_id = students.id
))
where sports.name='Football' and students.class='11';

select sum(paymentAmount), student_id from taxesPayments
group by student_id;