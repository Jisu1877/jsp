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
  	
  6. FrontController를 만든다.(확장자 패턴사용)
  	 Interface 만든다.('execute'메소드로 작업에 통일시킬 수 있도록 메소드명을 지정해준다.(service랑 같은 메소드))
  
  7. View작업을 진행하면서 DAO와 Service 객체를 활용한다.
  8. 테스팅(요구사항과 매칭되는지 체크) - 메뉴얼..
  9. 배포
 */

create table login (
	idx int not null auto_increment primary key,	/*고유번호*/
	mid varchar(20) not null,  	/*아이디*/
	pwd varchar(20) not null, 	/*비밀번호*/
	name varchar(20) not null,  /*회원 성명*/
	point int default 100,		/*포인트(최초 가입시 100포인트 지급)*/
	lastDate datetime default now(), /*최종 접속일자*/
	vCount int default 0		/*개별 방문자의 방문카운트 누적*/
);

desc login;

drop table login;

insert into login values (default, 'admin', '1234', '관리자', default, default, default);
insert into login values (default, 'hkd1234', '1234', '홍길동', default, default, default);
insert into login values (default, 'kms1234', '1234', '김말숙', default, default, default);
insert into login values (default, 'ljs1877', '1234', '이지수', default, default, default);

select * from login;

update login set point = point + 100 where vCount >= 20; 
update login set point = point + 100; 
select * from login where vCount >= 20;

select * from login order by lastDate desc, vCount, point;

select sum(point) as '포인트합계', avg(point) as '포인트평균', max(point) as '포인트최대', min(point) as '포인트최소' from login;

select * from login group by lastDate;

select count(point) as '포인트 200 이상되는 사람 수' from login where point >= 200;
select count(point) as '포인트 200 이상되는 사람 수', format(avg(point),1) as '포인트200넘는 포인트의 평균' from login where point >= 200;

delete from login where mid='kms1234';
delete from login;