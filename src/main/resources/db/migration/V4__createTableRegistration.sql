CREATE TABLE Registration (
    id        bigint(20) NOT NULL AUTO_INCREMENT,
    createdAt datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_id   bigint(20)  NOT NULL,
    course_id bigint(20)  NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_user_course (user_id, course_id),
    CONSTRAINT fk_registration_user FOREIGN KEY (user_id) REFERENCES User(id),
    CONSTRAINT fk_registration_course FOREIGN KEY (course_id) REFERENCES Course(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
