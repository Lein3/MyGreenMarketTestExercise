CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (null, 'Вася', 1000); 	--1
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (null, 'Витя', 1000); 	--2
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (1, 'Вова', 1000);		--3
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (1, 'Никита', 1000);	--4
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (2, 'Юра', 1000);		--5
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (5, 'Гена', 1000);		--6
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (3, 'Кеша', 1000); 	--7
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (3, 'Ваня', 1000);		--8
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (4, 'Петя', 1000);		--9
INSERT INTO "Users"("ID_Owner", "Name", "Salary") VALUES (4, 'Саша', 1000);		--10

INSERT INTO "Users"("ID_Owner", "Name", "Salary")
SELECT 
	floor(random()*(3000000))+1,
	'User_' || left(uuid_generate_v4()::text, 5),
	(random() * 500000)::decimal(10, 2)
FROM generate_series(1, 3000000)
order by random();