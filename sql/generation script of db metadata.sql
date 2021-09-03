use etaskifydb;

create table roles (
	id int not null auto_increment,
	role_name varchar(30),
	primary key(id)
);

insert into roles (role_name) 
values ('ROLE_USER'), ('ROLE_ADMIN');

create table tasks (
	id int not null auto_increment,
	title varchar(15),
	description varchar(50),
	deadline date,
	task_status varchar(30),
	primary key(id)
);

create table organizations (
	id int not null auto_increment,
	organization_name varchar(30),
	phone_number varchar(15),
	address varchar(50),
	primary key(id)
);

create table users (
	id int not null auto_increment,
	first_name varchar(30),
	last_name varchar(30),
	username varchar(30),
	password varchar(30),
	email varchar(30),
	organization_id int not null,
	primary key(id),
	foreign key (organization_id) references organizations(id)
);

create table users_roles (
	user_id int not null,
	role_id int not null,
	primary key(user_id, role_id),
	foreign key(user_id) references users(id),
	foreign key (role_id) references roles(id)
);

create table users_tasks (
	user_id int not null,
	task_id int not null,
	primary key(user_id, task_id),
	foreign key (user_id) references users(id),
	foreign key (task_id) references tasks(id)
);