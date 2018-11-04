drop table brandix_role_permission if exists;
drop table brandix_user_role if exists;
drop table brandix_user if exists;
drop table brandix_role if exists;
drop table permission if exists;

create table if not exists brandix_user(
    username varchar(255) not null,
    password varchar(255) not null,
    salt varchar(255) default null,
    primary key (username)
);

create table if not exists brandix_role(
    role varchar(255) not null,
    description varchar(255) default null,
    primary key (role)
);
	
create table if not exists brandix_permission(
    permission varchar(10),
    description varchar(255) default null,
    primary key (permission)
);

create table if not exists brandix_role_permission(
    role varchar(255) not null,
    permission varchar(255) not null,
	Foreign Key (role) REFERENCES brandix_role(role),
    Foreign Key (permission) REFERENCES brandix_permission(permission)
);
  
create table if not exists brandix_user_role(
    username varchar(255) not null,
    role varchar(255) not null,
	Foreign Key (username) REFERENCES brandix_user(username),
	Foreign Key (role) REFERENCES brandix_role(role)
);