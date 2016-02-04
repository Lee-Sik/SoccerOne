select * from FOOT_PUBLICGAME

update 




select game_no, team_name, game_location, game_date, ground, pay, game_state 
from FOOT_PUBLICGAME 
where game_date = '2016-02-25'
and pay BETWEEN 10000 and 500000
and game_state = '0'
and NVL(ground, '없음');



select * from foot_publicgame 
where GAME_LOCATION ='강남구' 
and GAME_DATE='2016-02-04' 
and GROUND (is null/is not null)
and game_state=1 
and pay BETWEEN 10000 and 500000;




SELECT * from foot_freegame where ROWNUM < 6 order by game_no desc 

SELECT NVL(count(*),0) AS cnt
			  FROM  FOOT_BBS  WHERE 1 = 1

SELECT * FROM FOOT_BBS
 			ORDER BY BBS_NO DESC


select * from FOOT_USER

select * from foot_bbs

create table foot_bbs(                    --친선경기 게시판 
   bbs_no number primary key, --게시글 시퀀스
   topic varchar2(50) not null,         --글유형
   user_email varchar2(50) not null,    --작성자
   title varchar2(200) not null,		--굴제목
   content varchar2(4000) not null,		--글내용
   wdate date not null,					--작성일
   good number(8) not null,						--좋아요
   readcount number(8) not null,					--조회수
   imageurl varchar2(50) not null,
   del number(8) not null,--그림주소
   
   CONSTRAINT FK_bbs FOREIGN KEY(user_email) REFERENCES foot_user(user_email)      
);

create sequence foot_bbs_seq
start with 1 increment by 1;


DROP TABLE foot_bbs CASCADE CONSTRAINT;

DROP SEQUENCE foot_bbs_seq;










update FOOT_PUBLICGAME set game_state = 1 where game_no = 2;

 INSERT INTO foot_publicgame VALUES(foot_publicgame_seq.nextval,#{team_name},#{game_location},#{game_date}
   									,#{ground},#{pay},0)





select * from foot_user

delete from FOOT_FREEGAME

drop table FOOT_FREEGAME

create table foot_freegame(                    --친선경기 게시판 
   game_no number primary key, --경기 시퀀스
   team_name varchar2(50) not null,         --team명
   game_content varchar2(20) not null,    --게임 내용
   game_date varchar2(20) not null,       --게임 날짜
   ground varchar2(20),                   --게임 장소
   pay number(10),                         --경기 금액
   CONSTRAINT FK_freegame FOREIGN KEY(team_name) REFERENCES foot_team(team_name)      
);

create sequence foot_freegame_seq
start with 1 increment by 1;

drop table foot_game_record



create table foot_game_record(--공식 경기만 기록하는 테이블
   game_no number not null,     --경기 시퀀스 번호 publicgame의 game_no와 forgin
   game_date varchar2(20) not null, 	   --경기 날짜
   score varchar2(50) not null,   	     -- 1,2  왼이 이긴팀 점수, 오른쪽이 진팀점수  
   win_team varchar2(20) not null,		   --승리팀
   lose_team varchar2(20) not null,		   --패팀
   maching_state number not null,		     --성사여부 최근 경기를 보여줄때 성사 여부에 따라 보여준다. '
   win_goal_player varchar2(50),	       --승리팀 골잡이 user_id,
   lose_goal_player varchar2(50),	       --패팀 골잡이   user_id, 
   home_local varchar2(50) not null,		 --홈팀 지역
   away_local varchar2(50) not null,		 --어웨이지역 
   CONSTRAINT FK_game_record FOREIGN KEY(game_no) REFERENCES foot_publicgame(game_no)       
);



drop table foot_publicgame

create table foot_publicgame(
   game_no number primary key, --경기 시퀀스
   team_name varchar2(50) not null,         --팀 이름
   game_location varchar2(20) not null,   --주활동지역구
   game_date varchar2(20) not null,       --게임 날짜
   ground varchar2(20) not null,          --구장 
   pay number(10) not null,		            --경기 금액
   game_state number(2) not null,          --매칭 상태 신청 됨(1), 안됨(0), 
   CONSTRAINT FK_publicgame FOREIGN KEY(team_name) REFERENCES foot_team(team_name)          
);

create sequence foot_publicgame_seq
start with 1 increment by 1;


select * from foot_publicgame


SELECT * from foot_freegame order by game_no desc





