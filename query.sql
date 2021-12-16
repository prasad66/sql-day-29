-- The Following are the tables has to be in your database & model deisgn:
-- users
-- codekata
-- attendance
-- topics
-- tasks
-- company_drives
-- mentors
-- students_activated_courses
-- courses

-- 1. Create tables for the above list given 
create table users(
id int ,
name varchar(30),
city varchar(30),
mobile varchar(10),
email varchar(30),
student_activated_course_id int,
course_id int,mentor_id int
);

create table codekata(
id int,
prob_name varchar(55),
prob_solved_id varchar(7),
user_id int
);

create table company_drives(
id int,
drive_name varchar(45),
user_id int
);

create table attendance(
user_id int,
no_of_days int
); 

create table topics(
id int,
topic_name varchar(50),
user_id int
);
 
 create table tasks(
id int,
task_name varchar(120),
user_id int
);

create table company_drives(
id int,
drive_name varchar(45),
user_id int
);

create table mentor(
id int,
mentor_name varchar(45),
mobile varchar(10),
email varchar(30)
);

create table student_activated_courses(
id int,
course_name varchar(30)
);

create table courses(
id int,
course_name varchar(30)
); 

-- 2. insert at least 5 rows of values in each table    

-- users 
insert into users values (1,'John','Chennai','7894562135','john@gmail.com',3,2,32);
insert into users values (2,'Doe','Bangalore','8954678946','doe@gmail.com',2,4,35);
insert into users values (3,'Sam','Kolkata','7589642130','sam@gmail.com',5,1,35);
insert into users values (4,'Ram','Pune','9876854315','ram@gmail.com',1,5,31);
insert into users values (5,'Sunny','Mumbai','8962401237','sunny@gmail.com',7,6,33);

-- codekata 
insert into codekata value(11,'Greedy Algorithm','d5e8a4a',1);
insert into codekata value(12,'Cold Fusion','e8r2e1w',3);
insert into codekata value(13,'Fusion Theory','q4s5d5e',4);
insert into codekata value(14,'Min Max Algo','c5s6z4g',2);
insert into codekata value(15,'Tar Algo','n4h5g6t',1);

-- company drive 
insert into company_drives values (21,'Campus Drive',1);
insert into company_drives values (22,'University Drive',2);
insert into company_drives values (23,'On-Campus Drive',3);
insert into company_drives values (24,'Off-Campus Drive',1);
insert into company_drives values (25,'Pool Drive',1);
insert into company_drives values (26,'ABC University Drive',1);
insert into company_drives values (27,'VTU University Drive',4);
insert into company_drives values (28,'TEMP Drive',4);
insert into company_drives values (29,'ALL INDIA Drive',5);

-- mentor 
insert into mentor values(31,'Lingam','7845612354','lingam@gmail.com',6);
insert into mentor values(32,'Pradeep','8454313456','pradeep@gmail.com',3);
insert into mentor values(33,'Venkatesh','9823476143','venkatesh@gmail.com',12);
insert into mentor values(34,'Ragav','7813854136','ragav@gmail.com',22);
insert into mentor values(35,'Soma','7095524634','some@gmail.com',10);

-- student_activated_courses
insert into student_activated_courses values (1,'Javascript');
insert into student_activated_courses values (2,'React');
insert into student_activated_courses values (3,'HTML5 & CSS3');
insert into student_activated_courses values (4,'Angular');
insert into student_activated_courses values (5,'Python');
insert into student_activated_courses values (6,'Data Science');
insert into student_activated_courses values (7,'Machine Learning');

-- courses

insert into courses values (1,'Javascript');
insert into courses values (2,'React');
insert into courses values (3,'HTML5 & CSS3');
insert into courses values (4,'Angular');
insert into courses values (5,'Python');
insert into courses values (6,'Data Science');
insert into courses values (7,'Machine Learning');

-- attendance

insert into attendance values (1,15);
insert into attendance values (2,20);
insert into attendance values (3,22);
insert into attendance values (4,25);
insert into attendance values (5,24);

-- tasks
insert into tasks values(101,'Painting',1);
insert into tasks values(102,'Writing',5);
insert into tasks values(103,'Printing',2);
insert into tasks values(104,'Cleaning',4);
insert into tasks values(105,'Drawing',3);

-- topics
insert into topics values(201,'Green House Effect',5);
insert into topics values(202,'Water Conservation',3);
insert into topics values(203,'Global Warming',2);
insert into topics values(204,'Sand Strom',1);
insert into topics values(205,'Rainwater Conservation',4);

-- 3. get number of problems solved by users combined
select count(*) as 'Problems solved by all users' from codekata join users on users.id = codekata.user_id;

-- 4.display the no of company drives attended by a user
select name,count(*) as 'number of company drives attended by Users' from users u left join company_drives c on u.id=c.user_id group by u.name ;

-- 5.combine and display students_activated_courses and courses for a specific user groping them based on the course
select u.name, sac.course_name as 'Student Activated Courses', c.course_name as 'Courses' from users u join student_activated_courses sac on u.student_activated_courses=sac.id join courses c on u.courses=c.id;

-- 6. list all the mentors	
select mentor_name from mentor;

-- 7. Number of students for the mentor
select m.mentor_name,count(u.name) as 'No. of Students' from mentor m join users u on m.id=u.mentor group by m.mentor_name;
