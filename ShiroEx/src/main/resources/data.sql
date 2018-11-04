insert into brandix_user(username, password, salt) values('balu', 'balu', 'balu');
insert into brandix_user(username, password, salt) values('john', 'john', 'john');
insert into brandix_user(username, password, salt) values('jack', 'jack', 'jack');
insert into brandix_user(username, password, salt) values('jill', 'jill', 'jill');
insert into brandix_user(username, password, salt) values('rose', 'rose', 'rose');
insert into brandix_user(username, password, salt) values('ramu', 'ramu', 'ramu');
insert into brandix_user(username, password, salt) values('divya', 'divya', 'divya');
insert into brandix_user(username, password, salt) values('priya', 'priya', 'priya');
insert into brandix_user(username, password, salt) values('sai', 'sai', 'sai');

insert into brandix_role(role) values('ADMIN');
insert into brandix_role(role) values('MANAGER');
insert into brandix_role(role) values('TEAM_LEAD');
insert into brandix_role(role) values('TEAM_MEMBER');

--insert into brandix_permission(permission) values('CREATE');
--insert into brandix_permission(permission) values('READ');
--insert into brandix_permission(permission) values('UPDATE');
--insert into brandix_permission(permission) values('DELETE');

insert into brandix_user_role(username, role) values('john', 'ADMIN');
insert into brandix_user_role(username, role) values('john', 'MANAGER');
insert into brandix_user_role(username, role) values('rose', 'MANAGER');
insert into brandix_user_role(username, role) values('sai', 'TEAM_LEAD');
insert into brandix_user_role(username, role) values('priya', 'TEAM_MEMBER');
insert into brandix_user_role(username, role) values('divya', 'TEAM_MEMBER');
insert into brandix_user_role(username, role) values('ramu', 'TEAM_MEMBER');
insert into brandix_user_role(username, role) values('jill', 'TEAM_LEAD');
insert into brandix_user_role(username, role) values('jack', 'TEAM_MEMBER');
insert into brandix_user_role(username, role) values('balu', 'TEAM_MEMBER');

--insert into brandix_role_permission(role, permission) values('ADMIN','CREATE');
--insert into brandix_role_permission(role, permission) values('ADMIN','READ');
--insert into brandix_role_permission(role, permission) values('ADMIN','UPDATE');
--insert into brandix_role_permission(role, permission) values('ADMIN','DELETE');
--insert into brandix_role_permission(role, permission) values('MANAGER','READ');
--insert into brandix_role_permission(role, permission) values('MANAGER','UPDATE');
--insert into brandix_role_permission(role, permission) values('MANAGER','DELETE');
--insert into brandix_role_permission(role, permission) values('TEAM_LEAD','READ');
--insert into brandix_role_permission(role, permission) values('TEAM_LEAD','UPDATE');
--insert into brandix_role_permission(role, permission) values('TEAM_MEMBER','READ');