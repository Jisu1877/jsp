show tables;

create table user (
	idx int not null auto_increment primary key,
	mid varchar(20) not null,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

desc user;

insert into user values(default, 'hkd1234', '홍길동', '22', '서울');
insert into user values(default, 'ddd1234', '디디디', '53', '충주');
insert into user values(default, 'fff1234', '프프프', '26', '부산');
insert into user values(default, 'ttt1234', '티티티', '52', '제주도');
insert into user values(default, 'sss1234', '스스스', '32', '포항');


select * from user order by idx desc;