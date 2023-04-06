create table destination(
    dest_id varchar2(100) primary key,
    dest_country varchar2(500),
    dest_name varchar2(1000) not null,
    dest_name_eng varchar2(1000),
    dest_content clob,
    dest_reference varchar2(100),
    dest_money Number(20,10),
    dest_landscape Number(20,10),
    dest_fun Number(20,3),
    dest_tag varchar2(2000),
    dest_img varchar2(2000),
    dest_cnt Number(20)
);

desc destination;

drop table destination;

insert into destination values('test01','후지산','일본','Mountain Fuji','그랜드 캐니언 국립공원(Grand Canyon National Park)은 미국 애리조나주에 있는 국립공원이다. 미국의 국립공원 중에서 가장 규모가 크고 웅장하고 신비로운 대협곡(그랜드 캐니언)이 유명한 세계적인 관광지로 꼽히며, 음역어로 大?谷?家公?(대협곡국가공원)이라고도 한다. 2016년 한해에 이 공원을 찾아온 방문자 수는 무려 600만 명에 이르렀다. 1,600m의 깊은 계곡에 흐르는 콜로라도 강을 사이에 두고 남쪽과 북쪽 양쪽으로 공원이 나뉜다. 북쪽의 공원을 노스림(North Rim)이라고 부르는데 이는 북쪽의 가장자리란 뜻이다. 남쪽 가장자리는 사우스림(South Rim)으로 불리는데 대부분의 관광객은 사우스림을 찾아온다. 그랜드 캐니언 국립공원의 면적은 1,904평방마일(4930km2)로 제주도 섬 전체 면적(1,846km2)의 2.7배에 해당되는 방대한 면적을 차지한다. 공원 지역 내에서의 콜로라도 강의 길이도 무려 277마일(443km)이 된다.세계적인 자연 경관의 대 협곡, 그랜드 캐니언을 국립공원으로 지정하려는 미국 정부의 노력은 1882년부터 시작되었으나 국립공원이 되기까지는 30여년의 오랜 시간이 걸렸다. 1903년 시어도어 루스벨트 대통령이 이곳을 방문해서 그랜드 캐니언을 보고 감격해서 아래와 같이 말했다.이와 같은 열정에도 불구하고 5년이 걸린 1908년에 와서야 그랜드 캐니언은 내셔널 모뉴먼트(National Monument)로 지정될 수 있었고 또 11년이 지난 1919년에 우드로 윌슨 대통령 재임 중 마침내 국립공원으로 승격되었다. 그랜드 캐니언 국립공원은 1979년에 유네스코 세계유산으로 지정되었다.공원은 1904평방마일(4930평방km)의 방대한 면적을 차지한다. 콜로라도 강을 사이에 두고 남과 북의 협곡으로 나뉘어 있다. 공원지역 내에서 콜로라도 강의 길이가 무려277마일(443km)로 한국의 한강 길이 (494km)에 가깝다. 캐니언의 폭은 제일 좁은 곳은 180m에서 제일 넓은 곳은 30km(600ft~18마일)까지 되며 협곡의 깊이는 약 1마일(1.6km)이 되는 협곡이다. 사우스림(South Rim)은 해발 2300m의 고원지대이며 강우량이 적은 편이나 노스림(Nouth Rim)은 해발 2700m가 되어 비교적 비와 눈이 많이 내린다. 따라서 북쪽 노스림은 남쪽의 사우스림보다 더',1.6,4,6.8,'녹지 소나무','https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip','test');

commit;

delete from destination where destination.dest_id like 'japan_01';

--'https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip
insert into destination values('vietnam_01','나트랑 해변','베트남','nha trang beach','Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.',2.56,4.33,5.96,'태도 기분 뷔페 진주 판매 러시아인','https://youimg1.tripcdn.com/target/100j0700000028nf2D4B0_C_760_506.jpg');


select * from member;

insert into member values('userid5','');
insert into member values('userid6','');
insert into member values('userid7','');


desc student;

alter table student modify id varchar2(100);
desc destination;
alter table board modify writer varchar2(200);
select * from member;
delete from member where userid='da1599';

commit;

update member set userlike='후지산,남산타워,도쿄타워,자유의 여신상'  where userid='userid1';
update member set userlike='후지산,남산타워,황푸강,쾰른 대성당,라스베이거스 스트립'  where userid='userid2';
update member set userlike='남산타워,도쿄타워,남이섬,마닐라 대성당,라스베이거스 스트립'  where userid='userid3';

insert into member values('da1599','');
insert into member values('test2','남이섬');



show user;

drop table member;

update destination set dest_cnt=0;

CREATE TABLE MEMBER(
ID VARCHAR2(12) PRIMARY KEY,
PASS VARCHAR2(12) NOT NULL,
NAME VARCHAR2(10) NOT NULL,
PHONE VARCHAR2(15),
EMAIL VARCHAR2(30) NOT NULL unique,
ZIPCODE VARCHAR2(7) NOT NULL,
ADDRESS1 VARCHAR2(120) NOT NULL,
ADDRESS2 VARCHAR2(50),
USERLIKE VARCHAR2(2000)
);

SELECT * FROM MEMBER;
select * from destination;
COMMIT;

insert into member values('sss','1234','테스트','010','test@naver.com','111-111','서울시 도봉구 쌍문동',null,null);

desc member;


commit;

select * from destination;

