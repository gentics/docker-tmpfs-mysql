DELETE FROM mysql.user;
CREATE USER 'root'@'%' IDENTIFIED BY 'finger', 'root'@'%' PASSWORD EXPIRE NEVER;
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS test;
