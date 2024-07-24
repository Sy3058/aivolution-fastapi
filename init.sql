USE userdb;

CREATE TABLE IF NOT EXISTS `userTable` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `opt` varchar(5) DEFAULT 'in',
  `isadmin` int DEFAULT 0,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `workTable` (
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `opt` varchar(5) DEFAULT NULL,
  `worknum` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `wtype` varchar(3) DEFAULT NULL,
  `videolength` varchar(10) DEFAULT NULL,
  `isprocess` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`worknum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `workTable` (`email`, `name`, `opt`, `worknum`, `isprocess`) VALUES ('process_number', 'pn', 'in', '0', 'N');

CREATE TABLE IF NOT EXISTS `anncTable` (
  `boardnum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(50) DEFAULT '관리자',
  `wrdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `viewcnt` int DEFAULT '0',
  PRIMARY KEY (`boardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `boardTable` (
  `boardnum` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `wrdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `viewcnt` int DEFAULT 0,
  `wremail` varchar(50) DEFAULT NULL,
  `replynum` int DEFAULT 0,
  PRIMARY KEY (`boardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `replyTable` (
  `replynum` int NOT NULL AUTO_INCREMENT,
  `boardnum` int DEFAULT NULL,
  `content` text,
  `wrdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replynum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
