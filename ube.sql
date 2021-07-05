-- -------------------------------------------------------------
-- TablePlus 4.0.0(370)
--
-- https://tableplus.com/
--
-- Database: ube
-- Generation Time: 2021-07-05 13:01:09.1450
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."graduation_condition";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."graduation_condition" (
    "student_type" varchar(255) NOT NULL,
    "minimum_success_lesson_count" int4,
    "project_required" bool,
    "thesis_required" bool,
    PRIMARY KEY ("student_type")
);

DROP TABLE IF EXISTS "public"."instructor";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."instructor" (
    "instructor_id" int8 NOT NULL,
    "monthly_salary" float8,
    "user_id" int4,
    PRIMARY KEY ("instructor_id")
);

DROP TABLE IF EXISTS "public"."instructor_type";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."instructor_type" (
    "id" int8 NOT NULL,
    "type_name" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."instructor_types";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."instructor_types" (
    "instructor_id" int8 NOT NULL,
    "type_id" int8 NOT NULL,
    PRIMARY KEY ("instructor_id","type_id")
);

DROP TABLE IF EXISTS "public"."lesson";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."lesson" (
    "lesson_id" int8 NOT NULL,
    "lesson_name" varchar(255),
    "semester" varchar(255),
    "year" date,
    "instructor_id" int8,
    PRIMARY KEY ("lesson_id")
);

DROP TABLE IF EXISTS "public"."lesson_conditions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."lesson_conditions" (
    "lesson_id" int8 NOT NULL,
    "student_type" varchar(255) NOT NULL,
    "minimum_point" float8,
    PRIMARY KEY ("lesson_id","student_type")
);

DROP TABLE IF EXISTS "public"."lesson_research_assistant";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."lesson_research_assistant" (
    "lesson_id" int8 NOT NULL,
    "research_assistant" int8,
    PRIMARY KEY ("lesson_id")
);

DROP TABLE IF EXISTS "public"."roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."roles" (
    "id" int4 NOT NULL,
    "name" varchar(20),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."student";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student" (
    "student_id" int8 NOT NULL,
    "graduated" bool,
    "counselor" int4,
    "user_id" int4,
    PRIMARY KEY ("student_id")
);

DROP TABLE IF EXISTS "public"."student_lesson";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student_lesson" (
    "lesson_id" int8 NOT NULL,
    "student_id" int8 NOT NULL,
    "points" float8,
    PRIMARY KEY ("lesson_id","student_id")
);

DROP TABLE IF EXISTS "public"."student_type";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student_type" (
    "id" int4 NOT NULL,
    "name" varchar(20),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."student_types";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."student_types" (
    "student_id" int8 NOT NULL,
    "type_id" int4 NOT NULL,
    PRIMARY KEY ("student_id","type_id")
);

DROP TABLE IF EXISTS "public"."user_roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."user_roles" (
    "user_id" int4 NOT NULL,
    "role_id" int4 NOT NULL,
    PRIMARY KEY ("user_id","role_id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."users" (
    "user_id" int4 NOT NULL,
    "birth_date" date,
    "email" varchar(255),
    "first_name" varchar(255),
    "last_name" varchar(255),
    "national_id" varchar(255),
    "password" varchar(255),
    "username" varchar(255),
    PRIMARY KEY ("user_id")
);

INSERT INTO "public"."graduation_condition" ("student_type", "minimum_success_lesson_count", "project_required", "thesis_required") VALUES
('DOCTORATE', 8, 'f', 't'),
('MASTER', 10, 't', 'f'),
('MASTER_THESIS', 7, 'f', 't');

INSERT INTO "public"."instructor_type" ("id", "type_name") VALUES
(1, 'DOCTOR'),
(2, 'ASSOCIATE_PROFESSOR'),
(3, 'PROFESSOR'),
(4, 'RESEARCH_ASSISTANT');

INSERT INTO "public"."roles" ("id", "name") VALUES
(1, 'ROLE_STUDENT'),
(2, 'ROLE_MODERATOR'),
(3, 'ROLE_ADMIN');

INSERT INTO "public"."student_type" ("id", "name") VALUES
(1, 'MASTER'),
(2, 'MASTER_THESIS'),
(3, 'DOCTORATE');

INSERT INTO "public"."users" ("user_id", "birth_date", "email", "first_name", "last_name", "national_id", "password", "username") VALUES
(1, '1995-08-22', 'deneme', 'den', 'test', '21321321', '$2y$10$cksKdC1P5QvbOzzx5tkl8u2nteWWcwiEqZ6fMDGFkteVY6xLkJw7S ', 'test');

ALTER TABLE "public"."instructor" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."instructor_types" ADD FOREIGN KEY ("type_id") REFERENCES "public"."instructor_type"("id");
ALTER TABLE "public"."instructor_types" ADD FOREIGN KEY ("instructor_id") REFERENCES "public"."instructor"("instructor_id");
ALTER TABLE "public"."lesson" ADD FOREIGN KEY ("instructor_id") REFERENCES "public"."instructor"("instructor_id");
ALTER TABLE "public"."lesson_research_assistant" ADD FOREIGN KEY ("research_assistant") REFERENCES "public"."instructor"("instructor_id");
ALTER TABLE "public"."student" ADD FOREIGN KEY ("counselor") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."student" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."student_types" ADD FOREIGN KEY ("student_id") REFERENCES "public"."student"("student_id");
ALTER TABLE "public"."student_types" ADD FOREIGN KEY ("type_id") REFERENCES "public"."student_type"("id");
ALTER TABLE "public"."user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id");
ALTER TABLE "public"."user_roles" ADD FOREIGN KEY ("role_id") REFERENCES "public"."roles"("id");
