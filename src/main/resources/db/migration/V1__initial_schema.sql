-- ScoreHub initial schema
-- V1 = first version, applied automatically by Flyway on startup

CREATE TABLE IF NOT EXISTS composers (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_year INTEGER,
    death_year INTEGER,
    nationality VARCHAR(100),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS scores (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    composer_id BIGINT REFERENCES composers(id),
    instrument VARCHAR(100),
    genre VARCHAR(100),
    difficulty_level INTEGER CHECK (difficulty_level BETWEEN 1 AND 10),
    file_path VARCHAR(1000),
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_scores_composer ON scores(composer_id);
CREATE INDEX idx_scores_instrument ON scores(instrument);
CREATE INDEX idx_scores_genre ON scores(genre);
