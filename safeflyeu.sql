drop database if exists safeFlyEU;
create database safeFlyEU character set utf8 collate utf8_general_ci;
# mysql -uedunova -pedunova --default_character_set=utf8 < c:\users\labak\documents\application\safeflyeu\safeflyeu.sql
use safeFlyEU;
create table airlineCompany(
				id 					int not null primary key auto_increment,
				name                varchar(50) not null,
				flight 				varchar(50) not null,
				airplane 			varchar(50) not null,
				employee			int not null,
				oib 				char(11) not null,
				iban 				char(21) not null,
				insurance           int not null
);
create table employee(
				id 					int not null primary key auto_increment,
				airlineCompany      int not null,
				name 				varchar(50) not null,
				surname 			varchar(50) not null,
				email 				varchar(50) not null,
				mobileNumber        varchar(20),
				contractNumber      varchar(5),
				oib 				char(11)
);
create table applicationUser(
				id 					int not null primary key auto_increment,
				name 				varchar(50) not null,
				surname 			varchar(50) not null,
				oib 				char(11) not null,
				email 				varchar(50) not null,
				mobileNumber 		varchar(20),
				insurance           int not null
);
create table insurance(
				id 					int not null primary key auto_increment,
				name		 		varchar(50) not null,
				insuranceType 		varchar(50) not null,
				iban				char(21) not null,
				oib 				char(11)
);
create table applicationUser_airlineCompany(
				applicationUser 	int not null,
				airlineCompany	 	int not null,
				seatMark				varchar(50) not null,
				food               	boolean,
				drink               boolean,
				luggage            	boolean
);

	alter table applicationUser 					add foreign key (insurance)		    references insurance(id);
	alter table applicationUser_airlineCompany 		add foreign key (applicationUser)	references applicationUser(id);
	alter table applicationUser_airlineCompany      add foreign key (airlineCompany) 	references airlineCompany(id);
	alter table airlineCompany 						add foreign key (insurance) 		references insurance(id);
	alter table airlineCompany 						add foreign key (employee)   	    references employee(id);
