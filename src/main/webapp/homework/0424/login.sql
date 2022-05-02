show tables;

/*
  프로젝트 작업순서...
  1. 업무분석
  2. 요구사항설계(요구사항 명세서)
  3. 데이터베이스(테이블/필드) 설계
  4. VO만들기
  5. DAO만들기
  	: JDBC 라이브러리를 lib폴더에 복사해 넣는다.
  	: Connection/PreparedStatment/ResultSet객체 생성
  6. View작업을 진행하면서 DAO와 Service 객체를 활용한다.
  7. 테스팅(요구사항과 매칭되는지 체크) - 메뉴얼..
  8. 배포
 */

create table login50 (
	idx int not null auto_increment primary key,	/*고유번호*/
	mid varchar(20) not null,  	/*아이디*/
	pwd varchar(20) not null, 	/*비밀번호*/
	name varchar(20) not null,  /*회원 성명*/
	point int default 100,		/*포인트(최초 가입시 100포인트 지급)*/
	lastDate datetime default now(), /*최종 접속일자*/
	vCount int default 0		/*개별 방문자의 방문카운트 누적*/
);

desc login;

drop table login50;

insert into login50 values (default, 'admin', '1234', '관리자', default, default, default);
insert into login50 values (default, 'hkd1234', '1234', '홍길동', default, default, default);
insert into login50 values (default, 'kms1234', '1234', '김말숙', default, default, default);
insert into login50 values (default, 'ljs1877', '1234', '이지수', default, default, default);
insert into login50 values (default, 'lkj1234', '1234', '이기자', default, default, default);
insert into login50 values (default, 'amk1234', '1234', '아무개', default, default, default);
insert into login50 values (default, 'kkk1234', '1234', '강감찬', default, default, default);


select * from login50 where mid = 'ljs1877' and pwd = '1234';
select * from login50;

delete from login where mid='kms1234';
delete from login;