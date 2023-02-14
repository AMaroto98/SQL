DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;


CREATE TABLE `departments` (
  `num` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `departments` (`num`, `name`) VALUES
(10, 'ACCOUNTING'),
(20, 'RESEARCH'),
(30, 'SALES'),
(40, 'PRODUCTION');


CREATE TABLE `employees` (
  `num` int(11) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `dept_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `employees` (`num`, `surname`, `name`, `occupation`, `manager`, `begin_date`, `salary`, `commission`, `dept_num`) VALUES
(1000, 'PITT', 'BRAD', 'OWNER', NULL, '1984-01-01', 104000, NULL, 20),
(7369, 'REDLEAF', 'JANE', 'EMPLOYEE', 8001, '1990-12-17', 104000, NULL, 20),
(7499, 'DERN', 'BRUCE', 'SALESMAN', 7698, '1990-02-20', 15000, 390, 30),
(7521, 'ROBINSON', 'SARAH', 'SALESMAN', 7782, '1991-02-22', 16250, 650, 30),
(7566, 'DI CAPRIO', 'LEONARDO', 'MANAGER', 1000, '1991-04-02', 29000, NULL, 20),
(7654, 'HERRIMAN', 'DAMON', 'SALESMAN', 7698, '1991-09-29', 16000, 1020, 30),
(7698, 'BRONSON', 'CHARLES', 'MANAGER', 1000, '1991-05-01', 30050, NULL, 30),
(7782, 'ROBBIE', 'MARGOT', 'MANAGER', 1000, '1991-06-09', 28850, NULL, 10),
(7788, 'MADISON', 'MIKEY', 'ANALYST', 8000, '1991-11-09', 30000, NULL, 20),
(7844, 'DUNHAM', 'LENA', 'SALESMAN', 7698, '1991-09-08', 13500, 0, 30),
(7876, 'RITTEN', 'REBECCA', 'EMPLOYEE', 7788, '1991-09-23', 14300, NULL, 20),
(7900, 'COLLINS', 'CLIFTON', 'EMPLOYEE', 8001, '1991-12-03', 13350, NULL, 30),
(7902, 'ROWLING', 'KANSAS', 'ANALYST', 8000, '1991-12-03', 30000, NULL, 20),
(7934, 'HARRIS', 'DANIELLE', 'EMPLOYEE', 8001, '1992-01-23', 16900, NULL, 10),
(8000, 'QUALLEY', 'MARGARET', 'MANAGER', 1000, '1991-01-09', 28850, NULL, 20),
(8001, 'FANNING', 'DAKOTA', 'MANAGER', 1000, '1992-06-10', 28850, NULL, 20);

ALTER TABLE `departments`
  ADD PRIMARY KEY (`num`);

ALTER TABLE `employees`
  ADD PRIMARY KEY (`num`),
  ADD KEY `dept_num` (`dept_num`),
  ADD KEY `manager` (`manager`);

ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_num`) REFERENCES `departments` (`num`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `employees` (`num`);
COMMIT;