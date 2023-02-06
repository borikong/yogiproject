create table destination(
    dest_id varchar2(10) primary key,
    dest_name varchar2(30) not null,
    dest_country varchar2(30),
    dest_name_eng varchar2(30),
    dest_content varchar2(1000),
    dest_money Number(20),
    dest_landscape Number(20),
    dest_fun Number(20),
    dest_tag varchar2(200),
    dest_img varchar2(200)
);

desc destination;

drop table destination;

insert into destination values('japan_01','������','�Ϻ�','Mountain Fuji','Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.',1.6,4,6.8,'���� �ҳ���','https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip');

commit;

delete from destination where destination.dest_id like 'japan_01';

--'https://youimg1.tripcdn.com/target/100v1f000001h1du4B7C4_C_900_600.jpg_.webp?proc=source%2ftrip
insert into destination values('vietnam_01','��Ʈ�� �غ�','��Ʈ��','nha trang beach','Using a series of utilities, you can
			create this jumbotron, just like the one in previous versions of
			Bootstrap. Check out the examples below for how you can remix and
			restyle it to your liking.',2.56,4.33,5.96,'�µ� ��� ���� ���� �Ǹ� ���þ���','https://youimg1.tripcdn.com/target/100j0700000028nf2D4B0_C_760_506.jpg');


select * from destination;