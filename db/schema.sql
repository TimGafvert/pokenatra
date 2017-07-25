DROP TABLE IF EXISTS pokemon;


create table pokemon (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  cp INT,
  img_url VARCHAR(255)
);
