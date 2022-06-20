-- Version 1.0 of entities
-- T-SQL
create table Owners (
	idOwner INT IDENTITY(1,1) PRIMARY KEY,
	username varchar(15) not null,
	name varchar(25) not null,
	lastName varchar(25),
	password varchar(80) not null,
	email varchar(40) not null,
	phone varchar(12)
);

create table PayMethods (
	idPayMethod INT IDENTITY(1,1) PRIMARY KEY,
	payMethod varchar(20)
);

create table Categories (
	idCategory INT IDENTITY(1,1) PRIMARY KEY,
	category varchar(20)
);

create table Businesses (
	idBussiness INT IDENTITY(1,1) PRIMARY KEY,
	name varchar(30) not null,
	idOwner int NOT NULL,
	finance money default 0 not null,
	isCountBalance bit default 0 not null,
	constraint FK_Bussiness_Owner foreign key (idOwner) references Owners (idOwner) on delete cascade on update cascade,
);

create table Clients(
	idClient INT IDENTITY(1,1) PRIMARY KEY,
	name varchar(30) not null,
	lastName varchar(30),
	address varchar(15) not null,
	phone varchar(12) not null,
	email varchar(40)
);

create table Providers(
	idProvider INT IDENTITY(1,1) PRIMARY KEY,
	name varchar(30) not null,
	address varchar(15) not null,
	phone varchar(12) not null,
	email varchar(40)
);

create table Products(
	idProduct INT IDENTITY(1,1) PRIMARY KEY,
	image varchar(100) not null,
	idCategory int not null,
	price money not null,
	unitaryCost money not null,
	quantity int not null
	constraint FK_Products_Category foreign key (idCategory) references Categories (idCategory) on delete cascade on update cascade,
);

create table Sales (
	idSale INT IDENTITY(1,1) PRIMARY KEY,
	dateSale datetime not null,
	idPayMethod int not null,
	idClient int not null,
	income money not null,
	idProduct int not null,
	constraint FK_Sales_PayMethod foreign key (idPayMethod) references PayMethods (idPayMethod) on delete cascade on update cascade,
	constraint FK_Sales_Client foreign key (idClient) references Clients (idClient) on delete cascade on update cascade,
	constraint FK_Sales_Product foreign key (idProduct) references Products (idProduct) on delete cascade on update cascade
);

create table Expenses (
	idExpense INT IDENTITY(1,1) PRIMARY KEY,
	dateExpense datetime not null,
	idPayMethod int not null,
	idProvider int not null,
	income money not null,
	idProduct int not null,
	constraint FK_Expenses_PayMethod foreign key (idPayMethod) references PayMethods (idPayMethod) on delete cascade on update cascade,
	constraint FK_Expenses_Provider foreign key (idProvider) references Providers (idProvider) on delete cascade on update cascade,
	constraint FK_Expenses_Product foreign key (idProduct) references Products (idProduct) on delete cascade on update cascade
);