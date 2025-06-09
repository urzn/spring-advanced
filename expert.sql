CREATE TABLE users (
   id BIGINT AUTO_INCREMENT PRIMARY KEY,
   email VARCHAR(255) NOT NULL UNIQUE,
   password VARCHAR(255) NOT NULL,
   user_role VARCHAR(50) NOT NULL,
   created_at TIMESTAMP,
   updated_at TIMESTAMP
);
CREATE TABLE managers (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  todo_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  FOREIGN KEY (todo_id) REFERENCES todos(id)
      ON DELETE CASCADE
);
CREATE TABLE todos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    contents TEXT,
    weather VARCHAR(100),
    user_id BIGINT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
       ON DELETE CASCADE
);
CREATE TABLE comments (
      id BIGINT AUTO_INCREMENT PRIMARY KEY,
      contents TEXT,
      user_id BIGINT NOT NULL,
      todo_id BIGINT NOT NULL,
      created_at DATETIME,
      updated_at DATETIME,
      FOREIGN KEY (user_id) REFERENCES users(id)
          ON DELETE CASCADE,
      FOREIGN KEY (todo_id) REFERENCES todos(id)
          ON DELETE CASCADE
);
