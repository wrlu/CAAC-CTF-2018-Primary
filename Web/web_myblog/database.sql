drop database if exists caac;
create database caac;
use caac;
drop table if exists userinfo;
drop table if exists secret;

create table userinfo(
  id int primary key,
  name varchar(20),
  introduction varchar(300)
);

create table secret(
  id int primary key ,
  flag varchar(100)
);
insert into userinfo value ( 1,'James','I am 26 years old,born in shandong province .I was graduated from qingdao university. my major is electronic.and i got my bachelor degree after my graduation in the year of 2003.');
insert into userinfo value (2,'Mary','I am very happy to introduce myself here.I was born in Liaoning Province.I graduated from Nankai University and majored in International Trade. I like music and reaing books,especially economical books.');
insert into secret value (1, 'flag{Y0u_D155_my_0Wn_810g}}');
