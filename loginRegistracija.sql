drop database if exists loginregistracija;
create database loginregistracija character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\labak\documents\application\safeflyeu\loginregistracija.sql
use loginregistracija;

create table loginRegistracija (
	id int not null primary key auto_increment,
	ime varchar(20) not null,
	prezime varchar(20) not null,
	username varchar(10) not null,
	password varchar(10) not null,
	repassword varchar(10) not null,
);	