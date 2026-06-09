-- 회원 테이블 생성

-- 유저 테이블 생성
create table nora.users(
   user_id bigint auto_increment primary key,
   u_name varchar(100),
   email varchar(200) unique,
   password text, -- password hash 값 저장
   phone varchar(11), 
   created_at timestamp,
   delete_yn char(1) -- Y/N
);

-- 카테고리 테이블 생성
create table nora.categories(
   category_id bigint auto_increment primary key,
   user_id bigint,
   
   c_name varchar(100),
   color varchar(6),
   created_at timestamp,
   delete_yn char(1), -- Y/N
   
   unique(user_id, c_name),
   constraint fk_categories_users foreign key(user_id) references nora.users(user_id)
);

-- 일정 테이블 생성
create table nora.schedules (
   schedule_id bigint auto_increment primary key,
   user_id bigint,
   category_id bigint,
   
   s_name varchar(300),
   start_date timestamp,
   end_date timestamp,
   location varchar(200),
   memo text,
   importance int, -- 1,2,3,4,5 
   
   constraint fk_schedules_users foreign key(user_id) references nora.users(user_id),
   constraint fk_schedules_category foreign key(category_id) references nora.categories(category_id)
);

-- 반복규칙 테이블 생성
create table nora.repeat_rules (
   repeat_id bigint auto_increment primary key,
   schedule_id bigint,
   repeat_type varchar(40),
   repeat_interval int,
   repeat_end_date timestamp,
   created_at timestamp,
   
   constraint fk_repeat_rules_schedule foreign key(schedule_id) references nora.schedules(schedule_id)
); 

-- ai 테이블 생성
create table nora.ai (
   ai_id bigint auto_increment primary key, 
   user_id bigint,
   
   user_input text,
   ai_response text,
   created_at timestamp,
     
   constraint fk_chat_users foreign key(user_id) references nora.users(user_id)
);

-- 알림 테이블 생성
create table nora.notice (
   notice_id bigint auto_increment primary key, 
   user_id bigint,
   
   message text,
   is_read char(1),
   created_at timestamp,
     
   constraint fk_notice_users foreign key(user_id) references nora.users(user_id)
);



-- vector store 생성
create table nora.vector_store(
   id bigint auto_increment primary key,
   text text,
   embedding longtext,
   metadata longtext,
   created_at timestamp
);


show tables; -- 7개 테이블 생성 확인
