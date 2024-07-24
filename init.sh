#!/bin/bash
set -e

# JSON 파일에서 필요한 값 추출
ADMIN_ID=$(grep "ADMIN_ID" /shared/secrets.json | cut -d '"' -f4)
ADMIN_NAME=$(grep "ADMIN_NAME" /shared/secrets.json | cut -d'"' -f4)
ADMIN_PICTURE=$(grep "ADMIN_PICTURE" /shared/secrets.json | cut -d'"' -f4)

# MySQL 명령 실행
mysql -u "${MYSQL_USER}" -p"$MYSQL_ROOT_PASSWORD" <<EOSQL
USE ${MYSQL_DATABASE};

CREATE TABLE IF NOT EXISTS userTable (
  email varchar(50) NOT NULL,
  name varchar(50) DEFAULT NULL,
  picture varchar(255) DEFAULT NULL,
  opt varchar(5) DEFAULT 'in',
  isadmin int DEFAULT 0,
  PRIMARY KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO userTable (email, name, picture, opt, isadmin) VALUES ('$ADMIN_ID', '$ADMIN_NAME', '$ADMIN_PICTURE', 'in', '1');

CREATE TABLE IF NOT EXISTS workTable (
  email varchar(50) DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  opt varchar(5) DEFAULT NULL,
  worknum varchar(50) NOT NULL,
  filename varchar(50) DEFAULT NULL,
  date varchar(10) DEFAULT NULL,
  wtype varchar(3) DEFAULT NULL,
  videolength varchar(10) DEFAULT NULL,
  isprocess varchar(5) DEFAULT 'W',
  PRIMARY KEY (worknum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO workTable (email, name, opt, worknum, isprocess) VALUES ('process_number', 'pn', 'in', '0', 'N');

CREATE TABLE IF NOT EXISTS anncTable (
  boardnum int NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  writer varchar(50) DEFAULT 'admin',
  wrdate datetime DEFAULT CURRENT_TIMESTAMP,
  viewcnt int DEFAULT '0',
  PRIMARY KEY (boardnum)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO anncTable (title, content) VALUES ('"AIditor" 오픈 공지', '<p> 안녕하세요, <span>AIvolution</span>입니다. </p>
  <br />
  <p> 쉽고 빠른 영상 편집을 위한 편집 서비스 "AIditor" 베타서비스를 오픈하였습니다.</p>
  <p> 현재 사용 가능한 기능은 다음과 같습니다.</p>
  <br />
  <p> 사용 가능한 기능 </p>
  <li> 유해정보 블라인드 </li>
  <li> 개인정보 보호 </li>
  <li> 얼굴 감지 </li>
  <br />
  <p> 번거로움 없이 영상을 편집할 수 있는 AIditor, 많이 이용해주세요.</p>
  <p> 감사합니다.</p>');

CREATE TABLE IF NOT EXISTS boardTable (
  boardnum int NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  writer varchar(50) DEFAULT NULL,
  wrdate datetime DEFAULT CURRENT_TIMESTAMP,
  viewcnt int DEFAULT 0,
  wremail varchar(50) DEFAULT NULL,
  replynum int DEFAULT 0,
  PRIMARY KEY (boardnum)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS replyTable (
  replynum int NOT NULL AUTO_INCREMENT,
  boardnum int DEFAULT NULL,
  content text,
  wrdate datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (replynum)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

EOSQL