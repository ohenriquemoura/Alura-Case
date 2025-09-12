CREATE TABLE Course (
    id                bigint(20)  NOT NULL AUTO_INCREMENT,
    name              varchar(100) NOT NULL,
    code              varchar(50)  NOT NULL,
    description       text,
    instructor_email  varchar(150) NOT NULL,
    status            varchar(10)  NOT NULL,
    deactivatedAt     datetime     NULL,
    category_id       bigint(20)   NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_course_code (code),
    CONSTRAINT fk_course_category FOREIGN KEY (category_id) REFERENCES Category(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;


