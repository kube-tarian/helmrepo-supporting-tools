CREATE DATABASE IF NOT EXISTS cerbos CHARACTER SET utf8mb4;

USE cerbos;

CREATE TABLE IF NOT EXISTS policy (
  id BIGINT PRIMARY KEY,
  kind VARCHAR(128) NOT NULL,
  name VARCHAR(1024) NOT NULL,
  version VARCHAR(128) NOT NULL,
  scope VARCHAR(512),
  description TEXT,
  disabled BOOLEAN default false,
  definition BLOB);

CREATE TABLE IF NOT EXISTS policy_dependency (
  policy_id BIGINT NOT NULL,
  dependency_id BIGINT NOT NULL,
  PRIMARY KEY (policy_id, dependency_id),
  FOREIGN KEY (policy_id) REFERENCES policy(id) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS policy_ancestor (
  policy_id BIGINT NOT NULL,
  ancestor_id BIGINT NOT NULL,
  PRIMARY KEY (policy_id, ancestor_id),
  FOREIGN KEY (policy_id) REFERENCES policy(id) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS policy_revision (
  revision_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  action ENUM('INSERT', 'UPDATE', 'DELETE'),
  id BIGINT NOT NULL,
  kind VARCHAR(128),
  name VARCHAR(1024),
  version VARCHAR(128),
  scope VARCHAR(512),
  description TEXT,
  disabled BOOLEAN,
  definition BLOB,
  update_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS attr_schema_defs (
  id VARCHAR(255) PRIMARY KEY,
  definition JSON);
