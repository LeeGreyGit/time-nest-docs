-- Project Name : Time Nest
-- Date/Time    : 2025/05/18 16:32:04
-- RDBMS Type   : MySQL

-- 仕事管理
CREATE TABLE works (
  work_id int auto_increment NOT NULL COMMENT '仕事ID'
  , work_name varchar(100) NOT NULL COMMENT '仕事名'
  , created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '作成日時'
  , created_by int COMMENT '作成者'
  , updated_at timestamp on update CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新日時'
  , updated_by int COMMENT '更新者'
  , delete_flag tinyint(1) DEFAULT 0 NOT NULL COMMENT '削除フラグ'
  , CONSTRAINT workings_PKC PRIMARY KEY (work_id)
) COMMENT '仕事管理' ;

-- タスク管理
CREATE TABLE tasks (
  task_id int auto_increment NOT NULL COMMENT 'タスクID'
  , work_id int NOT NULL COMMENT '仕事ID'
  , task_name varchar(100) NOT NULL COMMENT 'タスク名'
  , created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '作成日時'
  , created_by int COMMENT '作成者'
  , updated_at timestamp on update CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新日時'
  , updated_by int COMMENT '更新者'
  , delete_flag tinyint(1) DEFAULT 0 NOT NULL COMMENT '削除フラグ'
  , CONSTRAINT tasks_PKC PRIMARY KEY (task_id)
) COMMENT 'タスク管理' ;

-- 作業時間ログ管理
CREATE TABLE task_logs (
  log_id int auto_increment NOT NULL COMMENT 'ログID'
  , task_id int NOT NULL COMMENT 'タスクID'
  , start_time timestamp DEFAULT NULL COMMENT '開始日時'
  , end_time timestamp DEFAULT NULL COMMENT '終了日時'
  , created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '作成日時'
  , created_by int COMMENT '作成者'
  , updated_at timestamp on update CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新日時'
  , updated_by int COMMENT '更新者'
  , delete_flag tinyint(1) DEFAULT 0 NOT NULL COMMENT '削除フラグ'
  , CONSTRAINT logs_PKC PRIMARY KEY (log_id)
) COMMENT 'タスク時間ログ管理' ;

-- ユーザー管理
CREATE TABLE users (
  user_id int auto_increment NOT NULL COMMENT 'ユーザーID'
  , user_type_sv int DEFAULT 1 NOT NULL COMMENT 'ユーザータイプ:1: 一般ユーザー、2: 管理者など'
  , user_name varchar(100) NOT NULL COMMENT 'ユーザー名'
  , password varchar(255) COMMENT 'パスワード:ハッシュ化済値'
  , created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '作成日時'
  , created_by int COMMENT '作成者'
  , updated_at timestamp on update CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '更新日時'
  , updated_by int COMMENT '更新者'
  , delete_flag tinyint(1) DEFAULT 0 NOT NULL COMMENT '削除フラグ'
  , CONSTRAINT users_PKC PRIMARY KEY (user_id)
) COMMENT 'ユーザー管理' ;

