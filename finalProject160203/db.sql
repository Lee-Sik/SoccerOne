
ALTER TABLE FOOT_TEAM_LEAGE
ADD (CONSTRAINT fk_team_name_league) FOREIGN KEY (TEAM_NAME) REFERENCES FOOT_TEAM (TEAM_NAME);





create table foot_gallery(                    --친선경기 게시판 
   gallery_no number primary key, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   title varchar2(200) not null,		--굴제목
   content varchar2(4000) not null,		--글내용
   wdate date not null,					--작성일
   good number(8) not null,						--좋아요
   readcount number(8) not null,					--조회수
   imageurl varchar2(50) not null,  				--그림주소
   del number(8) not null,
   commentcount number(8) not null,
  
   CONSTRAINT FK_gallery FOREIGN KEY(user_email) REFERENCES foot_user(user_email)      
);

create sequence foot_gallery_seq
start with 1 increment by 1;

DROP TABLE foot_gallery CASCADE CONSTRAINT;

DROP SEQUENCE foot_gallery_seq;


SELECT U.USER_PROFILE, C.COMMENT_NO, C.PARENT_BBS_NO, C.USER_EMAIL, C.CONTENT, C.WDATE, C.DEL 
  			FROM FOOT_BBS_COMMENT C, FOOT_USER U
  			WHERE PARENT_BBS_NO = 84
  			AND C.USER_EMAIL = U.USER_EMAIL
 			ORDER BY COMMENT_NO ASC


		SELECT U.USER_PROFILE B.BBS_NO, B.TOPIC, B.USER_EMAIL, B.TITLE, B.CONTENT, B.WDATE, B.GOOD, B.READCOUNT, B.IMAGEURL, B.DEL, B.COMMENTCOUNT
			FROM FOOT_BBS B, FOOT_USER U
			WHERE B.BBS_NO = 79
			AND U.USER_EMAIL = B.USER_EMAIL


select *  from FOOT_USER

select *  from FOOT_BBS

create table foot_bbs_like(                    --친선경기 게시판 
   parent_bbs_no number not null, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   CONSTRAINT FK_parent_bbs_no FOREIGN KEY(parent_bbs_no) REFERENCES foot_bbs(bbs_no)      
);

create table foot_gallery_like(                    --친선경기 게시판 
   parent_gallery_no number not null, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   CONSTRAINT FK_parent_gallery_no FOREIGN KEY(parent_gallery_no) REFERENCES foot_gallery(gallery_no)      
);


SELECT count(PARENT_BBS_NO)
FROM FOOT_BBS_COMMENT
WHERE PARENT_BBS_NO = 67


SELECT T.TEAM_MANAGERID, F.GAME_NO, F.TEAM_NAME, F.GAME_LOCATION, F.GAME_DATE, F.GROUND, F.PAY, F.GAME_STATE
FROM FOOT_PUBLICGAME F, FOOT_TEAM T
WHERE F.GAME_NO=48
AND F.TEAM_NAME = T.TEAM_NAME;


select * from foot_team


select * from FOOT_BBS

delete good from FOOT_BBS

update FOOT_BBS set good = 0

delete from foot_bbs_like

select * from FOOT_BBS_LIKE


INSERT INTO FOOT_BBS_COMMENT
		(COMMENT_NO, PARENT_BBS_NO, USER_EMAIL, CONTENT, WDATE, DEL) 
		VALUES(foot_comment_seq.nextval,64,'4','dddd',SYSDATE,0)

create table foot_gallery_comment(                    --친선경기 게시판 
   comment_no number primary key, --게시글 시퀀스
   parent_gallery_no number not null, --게시글 시퀀스
   user_email varchar2(50) not null,    --작성자
   content varchar2(4000) not null,		--글내용
   wdate date not null,					--작성일
   del number(8) not null,
   CONSTRAINT FK_bbs_parent_gallery_no FOREIGN KEY(parent_gallery_no) REFERENCES foot_gallery(gallery_no)      
);

create sequence foot_gallery_comment_seq
start with 1 increment by 1;

select * from FOOT_freegame

SELECT * FROM FOOT_BBS_COMMENT
  			WHERE PARENT_BBS_NO = 62
 			ORDER BY COMMENT_NO DESC;
select * from FOOT_PUBLICGAME

delete from FOOT_BBS_COMMENT

create sequence foot_comment_seq
start with 1 increment by 1;

select * from FOOT_BBS_COMMENT
---------------����---------------------
DROP TABLE foot_bbs CASCADE CONSTRAINT;

DROP SEQUENCE foot_bbs_seq;


SELECT *
		FROM FOOT_PUBLICGAME
		WHERE game_no=28


SELECT * from foot_publicgame where ROWNUM < 6 order by game_no desc 

INSERT INTO foot_game_record
		VALUES(46,'2016-02-20',null, null, null,0,
		null,null,null,null,null,null)



SELECT * from foot_publicgame 
where game_no = (select MAX(game_no) from FOOT_PUBLICGAME)

        


select * from foot_freegame 
         and GAME_DATE = '2016-02-13'  

            and GROUND is not null
         
         and GAME_STATE = 0
         and PAY BETWEEN 10000 and 150000


this.game_no = game_no;
		this.game_date = game_date;
		this.score = score;
		this.win_team = win_team;
		this.lose_team = lose_team;
		this.maching_state = maching_state;
		this.win_goal_player = win_goal_player;
		this.lose_goal_player = lose_goal_player;
		this.home_local = home_local;
		this.away_local = away_local;
		this.win_team_logo = win_team_logo;
		this.lose_team_logo = lose_team_logo;


		INSERT INTO foot_game_record
		VALUES(#{game_no},#{game_date},null, null, null,0,
		null,null,null,null,null,null)



delete from FOOT_PUBLICGAME where game_no = 33

select * from FOOT_PUBLICGAME

update 

select * from foot_publicgame 
			where GAME_LOCATION = '강남구'
			and GAME_DATE = '2016-02-11'  

				and GROUND is not null

			
			and GAME_STATE = 0
			and pay BETWEEN 10000 and 150000;


select game_no, team_name, game_location, game_date, ground, pay, game_state 
from FOOT_PUBLICGAME 
where game_date = '2016-02-11'
and pay BETWEEN 10000 and 150000
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





