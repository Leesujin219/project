create table shopmember(
    num int not null primary key,   /*ȸ����ȣ*/
    memberlev varchar(2) default '10', /*ȸ�����*/
    id varchar(15) not null, 
    password varchar(12) not null,
    name varchar(12) not null,
    email varchar(30) not null,
    phone varchar(11) not null,
    gender varchar(1) not null,
    birthday varchar(8),
    age int, 
    addrnum varchar(8), /*�����ȣ*/
    address1 varchar(50),
    address2 varchar(50),
    reg_date date not null,
    buynum int default 0, /*����Ƚ��*/
    productnum int default 0 /*���Ż�ǰ��*/
);

select * from shopmember;
insert into shopmember(num,memberlev,id,password,name,email,phone,gender,reg_date)
    values(1,'1','admin','admin','������','admin','admin','f',sysdate);