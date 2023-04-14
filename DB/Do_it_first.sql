1. 커맨드 창에서
path PATH=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;c:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\;c:\Program Files\Microsoft SQL Server\100\Tools\Binn\;c:\Program Files\Microsoft SQL Server\100\DTS\Binn\;C:\Program Files\nodejs\;C:\Program Files\Git\cmd;C:\Program Files\MySQL\MySQL Shell 8.0\bin\;C:\Users\admin\AppData\Local\Microsoft\WindowsApps;C:\Program Files\Bandizip\;C:\Users\admin\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\admin\AppData\Roaming\npm;C:\Program Files\MySQL\MySQL Server 8.0\bin

2. 커맨드 창에서 
mysql -u root -p

3. 아래 몽땅 긁어서 실행

CREATE SCHEMA shoppingmall;

USE shoppingmall;

CREATE TABLE customers (
  idcustomers INT NOT NULL AUTO_INCREMENT,
  id                  VARCHAR(20) NOT NULL,
  name                VARCHAR(30) NOT NULL,
  phone               VARCHAR(13),
  email               VARCHAR(40),
  pw                  VARCHAR(30) NOT NULL,
  address             VARCHAR(50),
  joinDate            TIMESTAMP NOT NULL,
  lastLogin           TIMESTAMP NOT NULL,
  grade               VARCHAR(10) NOT NULL,
  loginFailCnt        INT NOT NULL,
  accountSuspension   BOOLEAN NOT NULL,
  PRIMARY KEY(idcustomers));

INSERT INTO customers (id, name, pw, joinDate, lastLogin, grade, loginFailCnt, accountSuspension) 
      VALUES ('tester', '테스터훈', '1234', '2005-07-01 14:44:44', '2023-04-05 14:44:44', '돌', 0, 0);

CREATE USER 'shoppingmall'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON shoppingmall.* TO 'shoppingmall'@'%';

CREATE TABLE category (
  idcategory          INT NOT NULL AUTO_INCREMENT,
  name                VARCHAR(30) NOT NULL,
  PRIMARY KEY(idcategory));

INSERT INTO category (name) VALUES ('안먹는거');
INSERT INTO category (name) VALUES ('먹는거');
INSERT INTO category (name) VALUES ('기타등등');

CREATE TABLE products (
  idproducts          INT NOT NULL AUTO_INCREMENT,
  category            INT NOT NULL,
  name                VARCHAR(30) NOT NULL,
  price               INT NOT NULL,
  registrationDate    TIMESTAMP NOT NULL,
  img                 VARCHAR(200),
  seller              VARCHAR(20) NOT NULL,
  PRIMARY KEY(idproducts));

INSERT INTO products (category, name, price, registrationDate, seller) 
      VALUES (1, '아이패드 프로' , 1000000, '2023-04-11 00:00:00', 'tester');
INSERT INTO products (category, name, price, registrationDate, seller) 
      VALUES (1, '갤럭시탭 플러스' , 570000, '2023-04-11 00:00:00', 'tester');
INSERT INTO products (category, name, price, registrationDate, seller) 
      VALUES (2, '양갈비 1Kg' , 40000, '2023-04-11 00:00:00', 'jwj');
