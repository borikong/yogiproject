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

insert into destination values('test01','������','�Ϻ�','Mountain Fuji','�׷��� ĳ�Ͼ� ��������(Grand Canyon National Park)�� �̱� �ָ������ֿ� �ִ� ���������̴�. �̱��� �������� �߿��� ���� �Ը� ũ�� �����ϰ� �ź�ο� ������(�׷��� ĳ�Ͼ�)�� ������ �������� �������� ������, ������� ��?��?ʫ��?(�����������)�̶�� �Ѵ�. 2016�� ���ؿ� �� ������ ã�ƿ� �湮�� ���� ���� 600�� �� �̸�����. 1,600m�� ���� �� �帣�� �ݷζ� ���� ���̿� �ΰ� ���ʰ� ���� �������� ������ ������. ������ ������ �뽺��(North Rim)�̶�� �θ��µ� �̴� ������ �����ڸ��� ���̴�. ���� �����ڸ��� ��콺��(South Rim)���� �Ҹ��µ� ��κ��� �������� ��콺���� ã�ƿ´�. �׷��� ĳ�Ͼ� ���������� ������ 1,904��渶��(4930km2)�� ���ֵ� �� ��ü ����(1,846km2)�� 2.7�迡 �ش�Ǵ� ����� ������ �����Ѵ�. ���� ���� �������� �ݷζ� ���� ���̵� ���� 277����(443km)�� �ȴ�.�������� �ڿ� ����� �� ����, �׷��� ĳ�Ͼ��� ������������ �����Ϸ��� �̱� ������ ����� 1882����� ���۵Ǿ����� ���������� �Ǳ������ 30������ ���� �ð��� �ɷȴ�. 1903�� �þ�� �罺��Ʈ ������� �̰��� �湮�ؼ� �׷��� ĳ�Ͼ��� ���� �����ؼ� �Ʒ��� ���� ���ߴ�.�̿� ���� �������� �ұ��ϰ� 5���� �ɸ� 1908�⿡ �ͼ��� �׷��� ĳ�Ͼ��� ���ų� �𴺸�Ʈ(National Monument)�� ������ �� �־��� �� 11���� ���� 1919�⿡ ���� ���� ����� ���� �� ��ħ�� ������������ �°ݵǾ���. �׷��� ĳ�Ͼ� ���������� 1979�⿡ ���׽��� ������������ �����Ǿ���.������ 1904��渶��(4930���km)�� ����� ������ �����Ѵ�. �ݷζ� ���� ���̿� �ΰ� ���� ���� �������� ������ �ִ�. �������� ������ �ݷζ� ���� ���̰� ����277����(443km)�� �ѱ��� �Ѱ� ���� (494km)�� ������. ĳ�Ͼ��� ���� ���� ���� ���� 180m���� ���� ���� ���� 30km(600ft~18����)���� �Ǹ� ������ ���̴� �� 1����(1.6km)�� �Ǵ� �����̴�. ��콺��(South Rim)�� �ع� 2300m�� ��������̸� ���췮�� ���� ���̳� �뽺��(Nouth Rim)�� �ع� 2700m�� �Ǿ� ���� ��� ���� ���� ������. ���� ���� �뽺���� ������ ��콺������ ��',1.6,4,6.8,'���� �ҳ���','https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip','test');

commit;

delete from destination where destination.dest_id like 'japan_01';

--'https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip
insert into destination values('vietnam_01','��Ʈ�� �غ�','��Ʈ��','nha trang beach','Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.',2.56,4.33,5.96,'�µ� ��� ���� ���� �Ǹ� ���þ���','https://youimg1.tripcdn.com/target/100j0700000028nf2D4B0_C_760_506.jpg');


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

update member set userlike='������,����Ÿ��,����Ÿ��,������ ���Ż�'  where userid='userid1';
update member set userlike='������,����Ÿ��,ȲǪ��,�븥 �뼺��,�󽺺��̰Ž� ��Ʈ��'  where userid='userid2';
update member set userlike='����Ÿ��,����Ÿ��,���̼�,���Ҷ� �뼺��,�󽺺��̰Ž� ��Ʈ��'  where userid='userid3';

insert into member values('da1599','');
insert into member values('test2','���̼�');



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

insert into member values('sss','1234','�׽�Ʈ','010','test@naver.com','111-111','����� ������ �ֹ���',null,null);

desc member;


commit;

select * from destination;

