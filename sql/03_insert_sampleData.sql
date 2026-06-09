-- 1. users
INSERT INTO nora.users (u_name, email, password, phone, delete_yn) VALUES
('김지수', 'jisu@timeflow.kr',   'test1234', '01011112222', 'N'),
('박민준', 'minjun@timeflow.kr', 'test1234', '01033334444', 'N'),
('이가현', 'gahyun@timeflow.kr', 'test1234', '01055556666', 'N');

-- 2. categories
INSERT INTO nora.categories (user_id, c_name, color, delete_yn) VALUES
(1, '업무',     '4A90E2', 'N'),
(1, '개인',     '7ED321', 'N'),
(2, '학교',     'F5A623', 'N'),
(2, '운동',     'D0021B', 'N'),
(3, '프로젝트', '9B59B6', 'N'),
(3, '약속',     '1ABC9C', 'N');

-- 3. schedules
INSERT INTO nora.schedules (user_id, category_id, s_name, start_date, end_date, location, memo, importance) VALUES
(1, 1, '팀 주간 회의',      '2025-06-10 10:00:00', '2025-06-10 11:00:00', '회의실 A',      '주간 업무 공유',        4),
(1, 1, '기획서 제출 마감',  '2025-06-11 18:00:00', '2025-06-11 18:30:00', NULL,            '최종본 팀장 메일 발송', 5),
(1, 2, '헬스장',            '2025-06-10 07:00:00', '2025-06-10 08:00:00', '강남 피트니스', NULL,                    3),
(2, 3, '데이터베이스 수업', '2025-06-10 09:00:00', '2025-06-10 10:30:00', '공학관 301호',  '중간고사 범위 확인',    4),
(2, 4, '러닝',              '2025-06-11 06:30:00', '2025-06-11 07:30:00', '한강공원',      '5km 목표',              2),
(3, 5, 'TimeFlow DB 설계',  '2025-06-10 14:00:00', '2025-06-10 16:00:00', NULL,            'ERD 최종 점검',         5),
(3, 6, '친구 생일 파티',    '2025-06-14 19:00:00', '2025-06-14 22:00:00', '홍대 레스토랑', '선물 미리 준비',        3);

-- 4. repeat_rules
INSERT INTO nora.repeat_rules (schedule_id, repeat_type, repeat_interval, repeat_end_date) VALUES
(1, 'WEEKLY', 1, '2025-12-31 00:00:00'),
(3, 'WEEKLY', 1, '2025-12-31 00:00:00'),
(4, 'WEEKLY', 1, '2025-08-31 00:00:00'),
(5, 'WEEKLY', 1, '2025-12-31 00:00:00');


-- <test>
-- #1) "user 1번의 일정 목록을 카테고리 이름과 함께 보여줘"
SELECT 
    s.s_name,
    s.start_date,
    s.end_date,
    c.c_name AS 카테고리,
    s.importance
FROM nora.schedules s
JOIN nora.categories c ON s.category_id = c.category_id
WHERE s.user_id = 1;

-- #2) 반복 일정인 것만 규칙과 함께 보여줘
SELECT
    s.s_name,
    s.start_date,
    r.repeat_type,
    r.repeat_interval,
    r.repeat_end_date
FROM nora.schedules s
JOIN nora.repeat_rules r ON s.schedule_id = r.schedule_id;