# ScoreHub 🎵

A Spring Boot based sheet music library and practice application for managing sheet music files, setlists, backing tracks, and practice sessions.

## Tech Stack

- **Java 21** + **Spring Boot 3.5.x**
- **PostgreSQL 16** (via Docker)
- **Flyway** for database migrations
- **MapStruct** for DTO mapping
- **Gradle** build system
- **GitHub Actions** CI/CD

## Features (planned)

- 📄 Sheet music CRUD with metadata (composer, genre, instrument, difficulty)
- 🏷️ Tagging and categorization
- 🎤 Artist management
- 📋 Setlist builder
- 🔍 Full-text search
- 🔐 JWT authentication & role-based access
- 📁 File upload and storage

## Getting Started

### Prerequisites

- Java 21+
- Docker & Docker Compose
- Gradle 8.x

### Run locally

`ash
# Start PostgreSQL
docker compose up -d

# Run the application
./gradlew bootRun
`

The API will be available at http://localhost:8080/api/v1/

## Project Structure

`
src/
├── main/java/com/scorehub/
│   ├── config/          # Configuration classes
│   ├── controller/      # REST controllers
│   ├── dto/             # Request/Response DTOs
│   ├── entity/          # JPA entities
│   ├── exception/       # Custom exceptions & handlers
│   ├── mapper/          # MapStruct mappers
│   ├── repository/      # Spring Data repositories
│   └── service/         # Business logic
└── test/
`

## Documentation

- [Project Plan](docs/PROJECT_PLAN.md) — Full architecture and development plan

## Development

- Feature branches: eature/<issue-number>-short-description
- PRs reference issues: Closes #<number>
- Commit convention: 	ype: description (feat, fix, docs, refactor, test, chore)

## License

MIT