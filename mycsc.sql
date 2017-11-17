create database mycsc;
use mycsc;

create table User(
    id serial,
    email varchar(255) not null unique,
    password varchar(255) not null,
    token int not null,
    createdAt datetime not null,
    updatedAt datetime not null,
    primary key(id)
);

create table CommonUser(
    id serial,
    name varchar(255) not null,
    img text,
    createdAt datetime not null,
    updatedAt datetime not null,
    userId bigint unsigned not null,
    constraint CommonUserUserId foreign key (userId) references User(id),
    primary key(id)
);

create table EnterpriseUser(
    id serial,
    tradeName varchar(255) not null,
    regCode varchar(255) not null,
    country varchar(255) not null,
    img text,
    createdAt datetime not null,
    updatedAt datetime not null,
    userId bigint unsigned not null,
    constraint EnterpriseUserUserId foreign key (userId) references User(id),
    primary key(id)
);

create table Product(
    id serial,
    brand varchar(255) not null,
    name varchar(255) not null,
    descripton text,
    img text,
    createdAt datetime not null,
    updatedAt datetime not null,
    enterpriseUserId bigint unsigned not null,
    constraint ProductEnterpriseUserId foreign key (enterpriseUserId) references EnterpriseUser(id),
    primary key(id)
);

create table Message(
    id serial,
    typeMessage varchar(255) not null,
    anonymous tinyint(1) not null,
    content text not null,
    attachment text,
    createdAt datetime not null,
    updatedAt datetime not null,
    commonUserId bigint unsigned not null,
    constraint MessageCommonUserId foreign key (commonUserId) references CommonUser(id),
    enterpriseUserId bigint unsigned,
    constraint MessageEnterpriseUserId foreign key (enterpriseUserId) references EnterpriseUser(id),
    productId bigint unsigned,
    constraint MessageProductId foreign key (productId) references Product(id),
    primary key(id)
);

create table Chat(
    id serial,
    content text not null,
    sentOn datetime not null,
    fromUserId bigint unsigned not null,
    constraint ChatFromUserId foreign key (fromUserId) references User(id),
    toUserId bigint unsigned not null,
    constraint ChatToUserId foreign key (toUserId) references User(id),
    primary key(id)
);

