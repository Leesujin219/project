create table shopmember(
    num int not null primary key,   /*회원번호*/
    memberlev varchar(2) default '10', /*회원등급*/
    id varchar(15) not null, 
    password varchar(12) not null,
    name varchar(12) not null,
    email varchar(30) not null,
    phone varchar(11) not null,
    gender varchar(1) not null,
    birthday varchar(8),
    age int, 
    addrnum varchar(8), /*우편번호*/
    address1 varchar(50),
    address2 varchar(50),
    reg_date date not null,
    buynum int default 0, /*구매횟수*/
    productnum int default 0 /*구매상품수*/
);

select * from shopmember;
insert into shopmember(num,memberlev,id,password,name,email,phone,gender,reg_date)
    values(1,'1','admin','admin','관리자','admin','admin','f',sysdate);