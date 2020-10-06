CREATE TABLE IF NOT EXISTS users (
	user_id serial CONSTRAINT USER_ID_PK PRIMARY KEY,
	user_name varchar(60) NOT NULL); 
CREATE TABLE IF NOT EXISTS liks (
	from_user serial,
	to_user serial,
	FOREIGN KEY (from_user)
	REFERENCES users(user_id),
	FOREIGN KEY (to_user)
	REFERENCES users(user_id),
    CONSTRAINT liks_user_from_user_to PRIMARY KEY (from_user, to_user),
    CONSTRAINT liks_check CHECK (from_user <> to_user)
);

INSERT INTO users (user_id, user_name)
     VALUES (1, 'Сидоров Сидор Сидорович'),
            (2, 'Иванов Иван Иванович'),
            (3, 'Петров Пётр Петрович');

INSERT INTO liks (from_user, to_user)
     VALUES (1, 3),
            (3, 2),
            (3, 1),
            (2, 3),
            (1, 2);
select count(*) from liks group by (from_user);
SELECT users.user_name as user_name, 
(select count(*) from liks WHERE liks.from_user = users.user_id) AS liked_from,
(select count(*) from liks WHERE liks.to_user = users.user_id) AS liked_to FROM users ORDER BY user_name;
