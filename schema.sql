-- UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Face detection schema
CREATE SCHEMA IF NOT EXISTS facedetect;

-- Table for storing users and their user data
CREATE TABLE IF NOT EXISTS facedetect.users (
	id   uuid    DEFAULT uuid_generate_v4(),
	name VARCHAR NOT NULL,
	PRIMARY KEY (id)
);

-- Table for storing face vectors and binding those faces to known users
CREATE TABLE IF NOT EXISTS facedetect.faces (
	face_id uuid                   DEFAULT uuid_generate_v4(),
	user_id uuid                   NOT NULL,
	vector  double precision ARRAY NOT NULL,
	PRIMARY KEY (face_id),
	CONSTRAINT check_user FOREIGN KEY(user_id) REFERENCES users(id)
);