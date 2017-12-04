create database mycsc;
use mycsc;

create table user(
    id serial,
    email varchar(255) not null unique,
    password varchar(255) not null,
    token int not null,
    created_at datetime not null,
    updated_at datetime not null,
    primary key(id)
);

create table common_user(
    id serial,
    name varchar(255) not null,
    img text,
    created_at datetime not null,
    updated_at datetime not null,
    user_id bigint unsigned not null,
    constraint common_user_user_id foreign key (user_id) references user(id),
    primary key(id)
);

create table enterprise_user(
    id serial,
    trade_name varchar(255) not null,
    reg_code varchar(255) not null,
    country varchar(255) not null,
    img text,
    created_at datetime not null,
    updated_at datetime not null,
    user_id bigint unsigned not null,
    constraint enterprise_user_user_id foreign key (user_id) references user(id),
    primary key(id)
);

create table product(
    id serial,
    brand varchar(255) not null,
    name varchar(255) not null,
    description text,
    img text,
    created_at datetime not null,
    updated_at datetime not null,
    enterprise_user_id bigint unsigned not null,
    constraint product_enterprise_user_id foreign key (enterprise_user_id) references enterprise_user(id),
    primary key(id)
);

create table message(
    id serial,
    message_type varchar(255) not null,
    anonymous tinyint(1) not null,
    content text not null,
    attachment text,
    created_at datetime not null,
    updated_at datetime not null,
    common_user_id bigint unsigned not null,
    constraint message_common_user_id foreign key (common_user_id) references common_user(id),
    enterprise_user_id bigint unsigned,
    constraint message_enterprise_user_id foreign key (enterprise_user_id) references enterprise_user(id),
    product_id bigint unsigned,
    constraint message_product_id foreign key (product_id) references product(id),
    primary key(id)
);

create table chat(
    id serial,
    content text not null,
    sent_on datetime not null,
    from_user_id bigint unsigned not null,
    constraint chat_from_user_id foreign key (from_user_id) references user(id),
    to_user_id bigint unsigned not null,
    constraint chat_to_user_id foreign key (to_user_id) references user(id),
    primary key(id)
);

