mysql -u root -p; -- root 접속 
create database nora; -- database 생성
show databases; -- 확인

grant all privileges on nora.* to 'scott'@'localhost';
flush privileges;
exit;

mysql -u scott -ptiger; -- scott계정으로 재접속
show databases; -- nora 조회보이는지 확인

use nora;