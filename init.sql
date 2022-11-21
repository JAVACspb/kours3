insert into auth (id, username, password, email) values (2, 'roma', 'roma', 'rom@mail.ru');
insert into auth (id, username, password, email) values (3, 'svs', 'rsss', 'sssss@mail.ru');
insert into auth (id, username, password, email) values (4, 'ret', 'vdvdfv', 'dvdvfdd@mail.ru');


insert into category (id, name, slug) values (1,'rrr', 'sss');
insert into category (id, name, slug) values (2,'dddd', 'ffff');


insert into service (id, category_id, title, price, slug) VALUES (1, 1, 'sss', 1000, 'rewww');
insert into service (id, category_id, title, price, slug) VALUES (2, 2, 'dddd', 4000, 'svvssv');

insert into payout (id,auth_id, amount, date, comment) VALUES (1, 2, 111, (select now()), 'ddddd');
insert into payout (id,auth_id, amount, date, comment) VALUES (2, 3, 3333, (select now()), 'vajkn');

insert into client (id, auth_id, name, string, status, phone) VALUES (1, 2, 'rrr', 'ffff', 'default', '89112588419');
insert into client (id, auth_id, name, string, status, phone) VALUES (2, 3, 'cscs', 'sdcsd', 'default', '89212588419');

insert into specialist (id, auth_id, name, surname, patronymic, status, rating, phone)
VALUES (1, 2, 'vdfd', 'dfvdv', 'fdvvd', 'working', 3, '365-65-65' );
insert into specialist (id, auth_id, name, surname, patronymic, status, rating, phone)
VALUES (2, 3, 'wewe', 'vsvfd', 'vdffd', 'working', 4, '364-64-64' );


insert into specialization (id, specialist_id, service_id) values (1, 1, 1);
insert into specialization (id, specialist_id, service_id) values (2, 2, 2);

insert into "order" (id, service_id, specialist_id, client_id, creation_time, status, comment, address, deadline)
VALUES (1, 1, 1, 1, (select now()), 'in_search', 'vdvfd', 'vdvfdf', (select now()));
insert into "order" (id, service_id, specialist_id, client_id, creation_time, status, comment, address, deadline)
VALUES (2, 2, 2, 2, (select now()), 'in_search', 'svsvs', 'svdsjvsvjk', (select now()));

insert into report (id, order_id, creation_time, text) VALUES (1, 1, (select now()), 'gejjk');
insert into report (id, order_id, creation_time, text) VALUES (2, 2, (select now()), 'vjkndjk');

insert into review (id, order_id, creation_time, text, rating) VALUES (1, 1, (select now()), 'vdvdf', 3);
insert into review (id, order_id, creation_time, text, rating) VALUES (2, 2, (select now()), 'vbdbg', 3);

insert into documents (id, order_id, url) values (1, 1, 'svfsv');
insert into documents (id, order_id, url) values (2, 2, 'kvjndfkj');

