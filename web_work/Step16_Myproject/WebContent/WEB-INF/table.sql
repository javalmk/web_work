--뷰카운트를 추가한 테이블

CREATE TABLE board_data(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER NOT NULL,
viewCount NUMBER, 
regdate DATE
);