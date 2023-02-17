CREATE DATABASE IF NOT EXISTS `EmployeesNormal`; 
USE `EmployeesNormal`; 
CREATE TABLE IF NOT EXISTS `DEPARTMENTS` ( 
`num` int(11) NOT NULL, 
`name` varchar(30) NOT NULL, 
`town_code` varchar(3) DEFAULT NULL, 
PRIMARY KEY (`num`), 
KEY `town_code` (`town_code`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `DEPARTMENTS` (`num`, `name`, `town_code`) VALUES 
(10, 'ACCOUNTING', 'SVQ'), 
(20, 'RESEARCH', 'MAD'), 
(30, 'SALES', 'BCN'), 
(40, 'PRODUCTION', 'BIO'); 
CREATE TABLE IF NOT EXISTS `EMPLOYEES` ( 
`num` int(11) NOT NULL, 
`surname` varchar(50) NOT NULL, 
`name` varchar(50) NOT NULL, 
`manager` int(11) DEFAULT NULL, 
`start_date` date DEFAULT NULL, 
`salary` int(11) DEFAULT NULL, 
`commission` int(11) DEFAULT NULL, 
`dept_num` int(11) DEFAULT NULL, 
`occu_code` varchar(3) DEFAULT NULL, 
PRIMARY KEY (`num`), 
KEY `dept_num` (`dept_num`), 
KEY `occu_code` (`occu_code`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
INSERT INTO `EMPLOYEES` (`num`, `surname`, `name`, `manager`, `start_date`, `salary`, `commission`, `dept_num`, `occu_code`) VALUES 
(800, 'BANDERAS', 'ANTONIO', 7839, '1991-01-09', 2885, NULL, 20, 'MAN'), (7369, 'SÁNCHEZ', 'SERGIO', 7902, '1990-12-17', 1040, NULL, 20, 'EMP'), (7499, 'ARROYO', 'MARTA', 7698, '1990-02-20', 1500, 390, 30, 'SAL'), (7521, 'SALA', 'RAUL', 7698, '1991-02-22', 1625, 650, 30, 'SAL'), (7566, 'ANTICH', 'MIQUEL', 7839, '1991-04-02', 2900, NULL, 20, 'MAN'), (7654, 'MARTÍN', 'MONICA', 7698, '1991-09-29', 1600, 1020, 30, 'SAL'), (7698, 'NEGRO', 'BARTOLOME', 7839, '1991-05-01', 3005, NULL, 30, 'MAN'), (7782, 'CEREZO', 'ENRIQUE', 7839, '1991-06-09', 2885, NULL, 10, 'MAN'), (7788, 'GIL', 'JESUS', 7566, '1991-11-09', 3000, NULL, 20, 'ANA'), (7844, 'TOVAR', 'LUIS', 7698, '1991-09-08', 1350, 0, 30, 'SAL'), 
(7876, 'ALONSO', 'FERNANDO', 7788, '1991-09-23', 1430, NULL, 20, 'EMP'), (7900, 'JIMENO', 'XAVIER', 7698, '1991-12-03', 1335, NULL, 30, 'EMP'), (7902, 'FERNÁNDEZ', 'ANA', 7566, '1991-12-03', 3000, NULL, 20, 'ANA'), (7934, 'MUÑOZ', 'ANTONIA', 7782, '1992-01-23', 1690, NULL, 10, 'EMP'), (8001, 'RUIZ', 'FERNANDA', 7839, '1992-06-10', 2885, NULL, 20, 'MAN'); 
CREATE TABLE IF NOT EXISTS `OCCUPATIONS` ( 
`code` varchar(3) NOT NULL, 
`name` varchar(30) NOT NULL, 
PRIMARY KEY (`code`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
INSERT INTO `OCCUPATIONS` (`code`, `name`) VALUES 
('ANA', 'ANALYST'), 
('EMP', 'EMPLOYEE'), 
('MAN', 'MANAGER'), 
('PRE', 'PRESIDENT'), 
('SAL', 'SALESMAN'); 
CREATE TABLE IF NOT EXISTS `TOWNS` ( 
`code` varchar(3) NOT NULL, 
`name` varchar(30) NOT NULL, 
PRIMARY KEY (`code`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 
INSERT INTO `TOWNS` (`code`, `name`) VALUES 
('BCN', 'BARCELONA'), 
('BIO', 'BILBAO'), 
('MAD', 'MADRID'),
('SVQ', 'SEVILLA'); 
ALTER TABLE `DEPARTMENTS` 
ADD CONSTRAINT `DEPARTMENTS_ibfk_1` FOREIGN KEY (`town_code`) REFERENCES `TOWNS` (`code`); 
ALTER TABLE `EMPLOYEES` 
ADD CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`dept_num`) REFERENCES `DEPARTMENTS` (`num`), 
ADD CONSTRAINT `EMPLOYEES_ibfk_2` FOREIGN KEY (`occu_code`) REFERENCES `OCCUPATIONS` (`code`); 
