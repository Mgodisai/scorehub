# ScoreHub Project Plan

## 1. Project Overview

**ScoreHub** is a Spring Boot based sheet music library and practice application. The goal of the project is to manage sheet music files, metadata, setlists, backing tracks, and later practice-related features such as offline setlist access, annotations, and practice sessions.

The first version should be a clean, well-structured backend reference project built with Java 21 and Spring Boot 3.x. Later, it can be extended with a web frontend, PDF sheet music viewer, audio player, cloud storage integration, and offline cache support.

This project is suitable both as a personal tool and as a GitHub portfolio/reference project for Java/Spring backend positions.

---

## 2. Main Goals

The project should demonstrate:

- Java 21 knowledge
- Spring Boot 3.x backend development
- REST API design
- Layered / feature-based architecture
- Spring Data JPA usage
- File upload and download handling
- Metadata management
- DTO/request model separation
- Validation
- Global exception handling
- Unit and integration testing
- OpenAPI / Swagger documentation
- Storage abstraction
- Local file storage first
- Future support for cloud storage such as OneDrive or Google Drive
- Future offline cache / offline setlist support
- Future frontend integration

The project should not start as a huge overcomplicated system. The first goal is to create a clean, working, useful backend application that can later grow naturally.

---

## 3. Suggested Project Name

Possible names:

- ScoreHub
- ScoreLibrary
- PracticeBook
- Setlist Studio
- MusicSheet Manager
- PracticeScore

Recommended name:

```text
ScoreHub
```

Recommended GitHub repository name:

```text
ScoreHub
```

or:

```text
ScoreHub-api
```

---

## 4. Short GitHub Description

```text
A Spring Boot based sheet music library and practice application for managing sheet music files, setlists, backing tracks, and offline practice material.
```

Longer README description:

```text
ScoreHub is a Java 21 and Spring Boot based backend application for managing sheet music files, metadata, setlists, backing tracks, and practice-related information. The project starts as a REST API and is designed to support a future web UI with PDF sheet music display, audio playback, cloud storage integration, and offline setlist caching.
```

---

## 5. Recommended Technology Stack

### Backend

```text
Java 21
Spring Boot 3.5.x
Spring Framework 6.2.x
Maven
Spring Web
Spring Data JPA
Spring Validation
Spring Security later
```

### Database

Initial development:

```text
H2 database or PostgreSQL in Docker
```

Recommended portfolio setup:

```text
PostgreSQL with Docker Compose
```

### File Storage

Initial version:

```text
Local filesystem storage
```

Later:

```text
OneDrive
Google Drive
S3-compatible storage
MinIO for local object-storage testing
```

### Testing

```text
JUnit 5
Mockito
Spring Boot Test
MockMvc
Testcontainers later
```

### Documentation

```text
OpenAPI / Swagger UI
README.md
API examples
Postman collection optional
```

### Frontend Later

Possible options:

```text
Angular
React
Vue
```

Recommended for this project:

```text
Angular or React PWA
```

---

## 6. High-Level Architecture

Long-term architecture:

```text
Frontend Web App / PWA
        |
        | REST API
        v
Spring Boot Backend
        |
        +-- PostgreSQL database for metadata
        |
        +-- Local / cloud storage for PDF and audio files
        |
        +-- Optional offline cache support
```

Initial architecture:

```text
Browser / API Client
        |
        v
Spring Boot REST API
        |
        +-- PostgreSQL or H2 database
        |
        +-- Local filesystem storage
```

---

## 7. Application Scope

The application should manage:

- Sheet music metadata
- PDF sheet music files
- Artists / composers
- Tags
- Setlists
- Setlist item ordering
- Backing tracks
- Practice sessions later
- Offline cache status later

---

## 8. Core Domain Concepts

### 8.1 SheetMusic

Represents one sheet music item.

Possible fields:

```text
id
title
artist
composer
keySignature
tempo
timeSignature
difficulty
style
notes
fileId
createdAt
updatedAt
```

Example:

```text
Title: Sweet Child O' Mine
Artist: Guns N' Roses
Key: D major
Tempo: 125 BPM
Difficulty: Intermediate
File: sweet-child-o-mine.pdf
```

### 8.2 Artist

Represents an artist or band.

Possible fields:

```text
id
name
createdAt
updatedAt
```

### 8.3 Tag

Used for flexible classification.

Examples:

```text
rock
blues
fingerstyle
beginner
solo
practice
performance
```

Possible fields:

```text
id
name
createdAt
updatedAt
```

### 8.4 Setlist

Represents an ordered list of sheet music items for a practice session, rehearsal, concert, or personal collection.

Possible fields:

```text
id
name
description
eventDate
createdAt
updatedAt
```

### 8.5 SetlistItem

Represents one item inside a setlist.

Possible fields:

```text
id
setlistId
sheetMusicId
orderIndex
notes
createdAt
updatedAt
```

### 8.6 BackingTrack

Represents an audio file attached to a sheet music item.

Possible fields:

```text
id
sheetMusicId
title
fileId
bpm
keySignature
durationSeconds
createdAt
updatedAt
```

Examples:

```text
Normal speed backing track
80 percent speed backing track
Solo practice backing track
```

### 8.7 StoredFile

Represents a physical or cloud-stored file.

Possible fields:

```text
id
storageProvider
storageId
originalFileName
contentType
sizeBytes
checksum
createdAt
updatedAt
```

Possible storage providers:

```text
LOCAL
GOOGLE_DRIVE
ONEDRIVE
S3
```

### 8.8 PracticeSession Later

Represents one practice event.

Possible fields:

```text
id
sheetMusicId
startedAt
endedAt
durationMinutes
notes
createdAt
updatedAt
```

---

## 9. Suggested Package Structure

Recommended feature-based package structure:

```text
src/main/java/com/example/ScoreHub
â”‚
â”œâ”€â”€ ScoreHubApplication.java
â”‚
â”œâ”€â”€ sheet
â”‚   â”œâ”€â”€ SheetMusic.java
â”‚   â”œâ”€â”€ SheetMusicController.java
â”‚   â”œâ”€â”€ SheetMusicService.java
â”‚   â”œâ”€â”€ SheetMusicRepository.java
â”‚   â”œâ”€â”€ SheetMusicDto.java
â”‚   â”œâ”€â”€ CreateSheetMusicRequest.java
â”‚   â”œâ”€â”€ UpdateSheetMusicRequest.java
â”‚   â””â”€â”€ SheetMusicMapper.java
â”‚
â”œâ”€â”€ artist
â”‚   â”œâ”€â”€ Artist.java
â”‚   â”œâ”€â”€ ArtistController.java
â”‚   â”œâ”€â”€ ArtistService.java
â”‚   â”œâ”€â”€ ArtistRepository.java
â”‚   â””â”€â”€ ArtistDto.java
â”‚
â”œâ”€â”€ tag
â”‚   â”œâ”€â”€ Tag.java
â”‚   â”œâ”€â”€ TagController.java
â”‚   â”œâ”€â”€ TagService.java
â”‚   â”œâ”€â”€ TagRepository.java
â”‚   â””â”€â”€ TagDto.java
â”‚
â”œâ”€â”€ setlist
â”‚   â”œâ”€â”€ Setlist.java
â”‚   â”œâ”€â”€ SetlistItem.java
â”‚   â”œâ”€â”€ SetlistController.java
â”‚   â”œâ”€â”€ SetlistService.java
â”‚   â”œâ”€â”€ SetlistRepository.java
â”‚   â”œâ”€â”€ SetlistItemRepository.java
â”‚   â”œâ”€â”€ SetlistDto.java
â”‚   â”œâ”€â”€ SetlistItemDto.java
â”‚   â””â”€â”€ ReorderSetlistRequest.java
â”‚
â”œâ”€â”€ backingtrack
â”‚   â”œâ”€â”€ BackingTrack.java
â”‚   â”œâ”€â”€ BackingTrackController.java
â”‚   â”œâ”€â”€ BackingTrackService.java
â”‚   â”œâ”€â”€ BackingTrackRepository.java
â”‚   â””â”€â”€ BackingTrackDto.java
â”‚
â”œâ”€â”€ storage
â”‚   â”œâ”€â”€ FileStorageService.java
â”‚   â”œâ”€â”€ StoredFile.java
â”‚   â”œâ”€â”€ StoredFileRepository.java
â”‚   â”œâ”€â”€ LocalFileStorageService.java
â”‚   â”œâ”€â”€ StoredFileDto.java
â”‚   â””â”€â”€ StorageProperties.java
â”‚
â”œâ”€â”€ practice
â”‚   â”œâ”€â”€ PracticeSession.java
â”‚   â”œâ”€â”€ PracticeSessionController.java
â”‚   â”œâ”€â”€ PracticeSessionService.java
â”‚   â””â”€â”€ PracticeSessionRepository.java
â”‚
â”œâ”€â”€ offline
â”‚   â”œâ”€â”€ CachedFile.java
â”‚   â”œâ”€â”€ CacheStatus.java
â”‚   â”œâ”€â”€ OfflinePackageService.java
â”‚   â””â”€â”€ OfflinePackageDto.java
â”‚
â”œâ”€â”€ common
â”‚   â”œâ”€â”€ ApiError.java
â”‚   â”œâ”€â”€ GlobalExceptionHandler.java
â”‚   â”œâ”€â”€ NotFoundException.java
â”‚   â”œâ”€â”€ DuplicateResourceException.java
â”‚   â”œâ”€â”€ InvalidOperationException.java
â”‚   â””â”€â”€ FileStorageException.java
â”‚
â””â”€â”€ config
    â”œâ”€â”€ OpenApiConfig.java
    â””â”€â”€ WebConfig.java
```

This structure is better than a purely technical package structure such as `controller`, `service`, `repository`, because it groups related functionality together.

---

## 10. REST API Ideas

### 10.1 Sheet Music API

```http
GET    /api/sheets
GET    /api/sheets/{id}
POST   /api/sheets
PUT    /api/sheets/{id}
DELETE /api/sheets/{id}
```

Search / filter examples:

```http
GET /api/sheets?title=hotel
GET /api/sheets?artist=metallica
GET /api/sheets?key=Em
GET /api/sheets?tag=practice
```

File endpoints:

```http
POST /api/sheets/{id}/file
GET  /api/sheets/{id}/file
DELETE /api/sheets/{id}/file
```

### 10.2 Artist API

```http
GET    /api/artists
GET    /api/artists/{id}
POST   /api/artists
PUT    /api/artists/{id}
DELETE /api/artists/{id}
```

### 10.3 Tag API

```http
GET    /api/tags
POST   /api/tags
DELETE /api/tags/{id}
```

Attach tags:

```http
POST   /api/sheets/{id}/tags/{tagId}
DELETE /api/sheets/{id}/tags/{tagId}
```

### 10.4 Setlist API

```http
GET    /api/setlists
GET    /api/setlists/{id}
POST   /api/setlists
PUT    /api/setlists/{id}
DELETE /api/setlists/{id}
```

Setlist item endpoints:

```http
POST   /api/setlists/{id}/items
DELETE /api/setlists/{id}/items/{itemId}
PUT    /api/setlists/{id}/items/reorder
```

Example reorder request:

```json
{
  "items": [
    { "itemId": 10, "orderIndex": 1 },
    { "itemId": 11, "orderIndex": 2 },
    { "itemId": 12, "orderIndex": 3 }
  ]
}
```

### 10.5 Backing Track API

```http
POST   /api/sheets/{id}/backing-tracks
GET    /api/sheets/{id}/backing-tracks
GET    /api/backing-tracks/{id}/file
DELETE /api/backing-tracks/{id}
```

### 10.6 Practice API Later

```http
POST /api/practice-sessions
GET  /api/practice-sessions
GET  /api/sheets/{id}/practice-sessions
```

### 10.7 Offline Package API Later

```http
POST /api/setlists/{id}/offline-package
GET  /api/setlists/{id}/offline-package/status
```

Possible response:

```json
{
  "setlistId": 12,
  "name": "Friday Practice",
  "items": [
    {
      "sheetId": 42,
      "title": "Song One",
      "pdfUrl": "/api/sheets/42/file",
      "backingTracks": [
        {
          "id": 5,
          "title": "Normal speed backing track",
          "url": "/api/backing-tracks/5/file"
        }
      ]
    }
  ]
}
```

---

## 11. Business Rules

The project should contain some real business rules, not only CRUD.

Possible rules:

```text
A sheet music item must have a title.
A PDF file must have an allowed content type.
A backing track must have an allowed audio content type.
A setlist item must belong to an existing setlist.
A sheet cannot appear twice in the same setlist unless duplicates are explicitly allowed.
Setlist item order must be unique within a setlist.
Deleting a sheet with setlist references should either be blocked or handled carefully.
Deleting a stored file should remove the physical file or mark it as deleted.
A backing track must belong to an existing sheet music item.
```

Recommended approach:

- Keep business validation in the service layer.
- Keep request validation in request models using Bean Validation.
- Use custom exceptions for domain errors.
- Convert exceptions to clean API responses in a global exception handler.

---

## 12. Validation Examples

Request model example:

```java
public record CreateSheetMusicRequest(
    @NotBlank
    @Size(max = 200)
    String title,

    @Size(max = 200)
    String artist,

    @Size(max = 20)
    String keySignature,

    @Min(1)
    @Max(300)
    Integer tempo,

    @Size(max = 1000)
    String notes
) {
}
```

File validation should check:

```text
content type
file extension
maximum file size
empty file
```

Allowed sheet file types initially:

```text
application/pdf
```

Allowed backing track file types initially:

```text
audio/mpeg
audio/mp3
audio/wav
audio/x-wav
```

---

## 13. Error Handling

Use a global exception handler.

Possible error response:

```json
{
  "timestamp": "2026-05-18T10:30:00Z",
  "status": 404,
  "error": "Not Found",
  "message": "Sheet music was not found",
  "path": "/api/sheets/42"
}
```

Custom exceptions:

```text
NotFoundException
DuplicateResourceException
InvalidOperationException
FileStorageException
ValidationException
```

Recommended Spring component:

```java
@RestControllerAdvice
public class GlobalExceptionHandler {
    // exception handlers here
}
```

---

## 14. Storage Design

### 14.1 Storage Strategy

Do not store PDF and audio files directly in the database.

Recommended strategy:

```text
Database stores metadata and storage references.
Filesystem/cloud storage stores the real binary files.
```

### 14.2 Storage Abstraction

Create an interface:

```java
public interface FileStorageService {
    StoredFile store(MultipartFile file, StoredFileType fileType);
    Resource load(String storageId);
    void delete(String storageId);
}
```

Possible implementations:

```text
LocalFileStorageService
GoogleDriveFileStorageService later
OneDriveFileStorageService later
S3FileStorageService later
```

### 14.3 Local Storage First

Example local paths:

Windows:

```text
C:\Users\<user>\AppData\Local\ScoreHub\Storage\Sheets
C:\Users\<user>\AppData\Local\ScoreHub\Storage\BackingTracks
```

Configurable application property:

```properties
ScoreHub.storage.provider=local
ScoreHub.storage.local.root=C:/ScoreHub/storage
```

### 14.4 Cloud Storage Later

Possible providers:

```text
OneDrive via Microsoft Graph
Google Drive via Google Drive API
S3-compatible storage
MinIO for local development
```

The metadata table should be ready for cloud storage:

```text
storage_provider
storage_id
original_file_name
content_type
size_bytes
checksum
```

---

## 15. GitHub and File Storage Rules

The GitHub repository should contain:

```text
source code
README.md
documentation
sample configuration
small demo files only if legally safe
tests
Docker Compose files
GitHub Actions workflow
```

The GitHub repository should not contain:

```text
real copyrighted sheet music
real backing tracks
large PDF/audio collections
personal files
```

Important note:

- GitHub is for source code and documentation.
- OneDrive / Google Drive / object storage is for real user files.
- Public portfolio repositories should avoid copyrighted sheet music or backing tracks.
- Use public domain or self-created demo files only.

---

## 16. Offline Cache and Synchronization

Offline support should be added in phases.

### 16.1 Cache vs Sync

Cache means:

```text
Files opened or selected by the user are stored locally for later offline access.
```

Sync means:

```text
Local changes and cloud changes are synchronized in both directions.
```

Start with cache, not full sync.

### 16.2 Phase 1: Read-Only Offline Cache

Features:

```text
User opens a PDF online.
App stores it in local/browser cache.
User can open the file later without network.
```

### 16.3 Phase 2: Offline Setlist Package

This is the most useful offline feature.

User flow:

```text
User creates a setlist.
User clicks: Download for offline use.
App downloads all PDFs and backing tracks for the setlist.
App stores metadata and files locally.
User can open the setlist offline.
```

### 16.4 Phase 3: Offline Metadata Editing Later

Later features:

```text
edit notes offline
change setlist order offline
add practice notes offline
sync changes when online
```

This requires conflict handling.

### 16.5 Cache Model

Possible fields:

```text
id
ownerType
ownerId
fileType
cloudProvider
cloudFileId
localCacheKey
originalFileName
contentType
sizeBytes
checksum
cloudModifiedAt
cachedAt
lastAccessedAt
status
```

Possible cache statuses:

```text
NOT_CACHED
CACHING
AVAILABLE
STALE
FAILED
```

### 16.6 Web App Offline Support

If the frontend is a web app, use:

```text
Service Worker
Cache Storage API
IndexedDB
PWA support
```

Possible frontend cache architecture:

```text
Spring Boot API
    |
    v
Angular/React PWA
    |
    +-- IndexedDB for metadata cache
    +-- Cache Storage for PDF/audio files
    +-- Service Worker for offline fetch handling
```

---

## 17. Frontend Vision

The first project can be backend-only. Later a frontend can be added.

### 17.1 Basic UI

Features:

```text
list sheets
search sheets
upload PDF
edit metadata
open PDF in browser
create setlists
add sheets to setlists
```

### 17.2 PDF Viewer

Options:

```text
browser native PDF viewer
PDF.js
custom viewer later
```

First version:

```text
Open PDF in browser or embedded iframe/object viewer.
```

Later:

```text
PDF.js for zoom, page navigation, fullscreen mode, and custom controls.
```

### 17.3 Practice Mode

Possible layout:

```text
Main area: PDF sheet music viewer
Bottom area: audio player
Side panel: notes, tags, practice status
```

Features:

```text
play / pause backing track
seek audio
show current sheet
next / previous sheet in setlist
fullscreen mode
practice notes
```

Later advanced features:

```text
metronome
loop section
speed control
pitch control
annotations
keyboard shortcuts
MIDI page turning
```

---

## 18. Deployment Options

### 18.1 Local Development

Run backend from IDE:

```text
Spring Boot app runs on http://localhost:8080
Frontend runs separately on http://localhost:4200 or another dev port
```

### 18.2 Single Local JAR

Spring Boot includes embedded web server.

Run:

```bash
java -jar ScoreHub.jar
```

Access:

```text
http://localhost:8080
```

The frontend can later be built and copied into:

```text
src/main/resources/static
```

Then frontend and backend can be served from one Spring Boot JAR.

### 18.3 Home Network Access

Configure Spring Boot:

```properties
server.address=0.0.0.0
server.port=8080
```

Access from another device on the same network:

```text
http://192.168.1.50:8080
```

Requirements:

```text
same Wi-Fi / LAN
Windows Firewall allows port 8080
host machine is running
```

### 18.4 Windows Service Later

The application can be installed as a Windows Service.

Possible service name:

```text
ScoreHub Service
```

Benefits:

```text
starts with Windows
runs in background
more convenient for local/home server use
```

### 18.5 Docker Compose

Recommended portfolio deployment method:

```text
Spring Boot app
PostgreSQL database
optional MinIO storage later
```

Example future command:

```bash
docker compose up -d
```

### 18.6 Home Server / NAS / Mini PC

Possible deployment targets:

```text
old laptop
mini PC
NAS with Docker support
Raspberry Pi if compatible
home server
```

Access:

```text
http://ScoreHub.local:8080
```

or:

```text
http://192.168.1.100:8080
```

### 18.7 Cloud Deployment Later

Possible cloud targets:

```text
Azure App Service
Render
Railway
Fly.io
Google Cloud Run
VPS
```

If publicly accessible, the app needs:

```text
HTTPS
authentication
authorization
backup
secure storage configuration
```

---

## 19. Authentication and Security

### 19.1 Initial Version

For local-only development:

```text
Authentication can be skipped initially.
```

### 19.2 Later Versions

If accessible from other devices or the internet, add authentication.

Minimum:

```text
one admin user
login
session-based authentication or JWT
```

Spring technology:

```text
Spring Security
```

Avoid adding complex OAuth2 too early.

### 19.3 Security Concerns

Important checks:

```text
validate uploaded file types
limit file size
avoid path traversal
avoid exposing local filesystem paths
protect file download endpoints
sanitize user input
use HTTPS when exposed outside localhost
```

---

## 20. Database Strategy

### 20.1 Initial

Use H2 or PostgreSQL.

Recommended:

```text
H2 for very first prototype
PostgreSQL for serious GitHub reference
```

### 20.2 Migration Tool

Add later:

```text
Flyway
```

Example migration files:

```text
V1__create_sheet_music_table.sql
V2__create_stored_file_table.sql
V3__create_setlist_tables.sql
V4__create_backing_track_table.sql
```

---

## 21. Testing Strategy

### 21.1 Unit Tests

Test service layer business logic.

Examples:

```text
create sheet music
reject empty title
add sheet to setlist
prevent duplicate setlist order
store file metadata
```

Tools:

```text
JUnit 5
Mockito
AssertJ optional
```

### 21.2 Controller Tests

Test REST API behavior.

Tools:

```text
MockMvc
Spring Boot Test
```

Examples:

```text
POST /api/sheets returns 201
GET /api/sheets/{id} returns 404 for missing sheet
file upload validates content type
```

### 21.3 Integration Tests Later

Tools:

```text
Testcontainers
PostgreSQL container
```

---

## 22. GitHub Portfolio Checklist

The repository should include:

```text
README.md
clear project description
technology stack
architecture overview
API examples
how to run locally
how to run with Docker Compose
testing instructions
screenshots later
OpenAPI link later
GitHub Actions workflow
```

Recommended badges:

```text
build status
Java version
Spring Boot version
license
```

---

## 23. Suggested README Structure

```markdown
# ScoreHub

## Overview

## Features

## Technology Stack

## Architecture

## Domain Model

## API Endpoints

## Running Locally

## Running with Docker Compose

## Configuration

## Testing

## Storage Strategy

## Roadmap

## Screenshots

## License
```

---

## 24. Development Roadmap

### Phase 1: Backend MVP

Goal: create a clean backend API.

Features:

```text
Create/list/get/update/delete sheet music metadata
Upload PDF file for sheet music
Download/view PDF file
Local file storage
Global exception handling
Validation
Basic tests
README
```

### Phase 2: Setlists

Features:

```text
Create/list/get/update/delete setlists
Add sheet to setlist
Remove sheet from setlist
Reorder setlist items
List sheets in setlist order
```

### Phase 3: Backing Tracks

Features:

```text
Upload backing track
Attach backing track to sheet
Download/stream backing track
List backing tracks by sheet
```

### Phase 4: PostgreSQL and Docker

Features:

```text
PostgreSQL support
Docker Compose
persistent storage volume
better local setup
```

### Phase 5: OpenAPI and GitHub Polish

Features:

```text
Swagger UI
API examples
GitHub Actions build
better README
sample data
```

### Phase 6: Basic Web UI

Features:

```text
sheet list
sheet detail page
PDF view
upload form
setlist management
```

### Phase 7: Practice Mode

Features:

```text
PDF viewer
audio player
sheet + backing track together
next/previous sheet in setlist
practice notes
```

### Phase 8: Offline Setlist Cache

Features:

```text
download setlist for offline use
cache all related PDFs and backing tracks
show cache status
open cached setlist offline
```

### Phase 9: Cloud Storage

Features:

```text
storage abstraction completed
OneDrive or Google Drive provider
cloud file references
configurable storage provider
```

### Phase 10: Security and Remote Access

Features:

```text
login
Spring Security
HTTPS deployment
cloud or home server deployment
```

---

## 25. Recommended Initial MVP Scope

Do not start too large.

The best first version:

```text
Sheet music CRUD
PDF upload
PDF download/view
Local file storage
Search by title/artist
Validation
Global exception handling
PostgreSQL or H2
Unit tests
README
```

This is enough to create a useful and portfolio-worthy backend start.

---

## 26. Suggested First Milestones / Commits

Possible commit sequence:

```text
Initial Spring Boot project setup
Add sheet music domain model
Add sheet music repository and service
Add sheet music REST endpoints
Add request validation
Add global exception handling
Add local file storage service
Add PDF upload endpoint
Add PDF download endpoint
Add setlist domain model
Add setlist REST endpoints
Add setlist item reorder support
Add backing track upload support
Add PostgreSQL Docker Compose setup
Add OpenAPI documentation
Add service layer unit tests
Add GitHub Actions build workflow
Update README with setup and API examples
```

---

## 27. Example Interview Explanation

Possible English explanation:

```text
I created ScoreHub as a personal Spring Boot reference project. It is a sheet music library and practice application built with Java 21 and Spring Boot. The first version focuses on backend development: REST APIs, metadata management, file upload and download, local file storage, validation, exception handling, and tests.

The project is designed to be extended later with a web UI, PDF sheet music display, backing track playback, cloud storage integration, and offline setlist caching. I chose this project because it connects my interest in music with backend development, and it allows me to demonstrate practical Java/Spring skills beyond a simple CRUD application.
```

---

## 28. What to Avoid in the First Version

Do not start with:

```text
OAuth2 login
cloud storage integration
real-time sync
mobile app
advanced PDF annotations
audio pitch shifting
MIDI support
microservices
Kubernetes
complex multi-user permissions
```

These are interesting later, but they can easily make the first version too large.

The first version should be simple, finished, and clean.

---

## 29. Long-Term Product Vision

Long-term vision:

```text
ScoreHub becomes a personal music practice web application where the user can manage sheet music, organize setlists, attach backing tracks, open PDFs during practice, and download complete setlists for offline use.
```

Possible long-term features:

```text
cloud storage integration
PWA installable frontend
offline setlists
PDF annotations
backing track player
practice history
metronome
keyboard shortcuts
fullscreen performance mode
mobile/tablet layout
MIDI page turning
```

---

## 30. Final Recommendation

Recommended first implementation path:

```text
Java 21
Spring Boot 3.5.x
Spring Data JPA
PostgreSQL or H2
Local filesystem storage
REST API only first
Setlists second
Backing tracks third
Frontend later
Offline cache later
Cloud storage later
```

The project should start as a clean Spring Boot backend portfolio project and grow into a useful personal music practice application.

---

## 31. Review Notes and Enhancement Suggestions

> This section was added after an independent review of the project plan.
> Goal: identify gaps, improvements, and further ideas that increase
> the project's value both as a personal tool and as an interview portfolio piece.

---

### 31.1 Architectural and Design Improvements

#### API Versioning from Day One

Use a versioned URL prefix from the very beginning:

```text
/api/v1/sheets
/api/v1/setlists
/api/v1/artists
```

This is nearly free to implement but signals production-readiness thinking to reviewers. It also prevents painful URL migrations later if the API evolves.

#### Pagination and Sorting on All List Endpoints

Every `GET` collection endpoint should support pagination from the start:

```http
GET /api/v1/sheets?page=0&size=20&sort=title,asc
```

Spring Data's `Page<T>` and `Pageable` make this trivial. Returning unpaginated collections is an anti-pattern in production systems and interviewers will notice.

Recommended response envelope:

```json
{
  "content": [...],
  "page": 0,
  "size": 20,
  "totalElements": 142,
  "totalPages": 8
}
```

#### MapStruct Instead of Manual Mappers

Replace hand-written `SheetMusicMapper.java` with MapStruct:

```xml
<dependency>
    <groupId>org.mapstruct</groupId>
    <artifactId>mapstruct</artifactId>
    <version>1.5.5.Final</version>
</dependency>
```

Benefits:
- Compile-time type safety (no runtime reflection like ModelMapper)
- Generated source code is visible and debuggable
- Frequently asked about in Spring interviews
- Reduces boilerplate significantly

#### Flyway Migrations from the Start (Not "Later")

Move database migrations from Phase 4 to Phase 1. Using `spring.jpa.hibernate.ddl-auto=update` is a development shortcut that interviewers associate with junior-level projects. Flyway migrations demonstrate:

- Version-controlled schema evolution
- Repeatable, auditable deployments
- Team collaboration awareness

Recommended first migration set:

```text
V1__create_sheet_music_table.sql
V2__create_stored_file_table.sql
V3__create_artist_table.sql
V4__create_tag_tables.sql
```

#### Spring Data Auditing

Enable `@EnableJpaAuditing` and use:

```java
@CreatedDate
private Instant createdAt;

@LastModifiedDate
private Instant updatedAt;

@CreatedBy
private String createdBy;

@LastModifiedBy
private String modifiedBy;
```

This is minimal effort but signals enterprise-level thinking. The `createdBy`/`modifiedBy` fields become useful once authentication is added.

---

### 31.2 Security â€” Earlier Rather Than Later

The current plan places security at Phase 10 (last). Recommendation: introduce a basic JWT auth by the end of Phase 5 at the latest.

Suggested minimal implementation:

```text
POST /api/v1/auth/register
POST /api/v1/auth/login    â†’ returns JWT
POST /api/v1/auth/refresh  â†’ refresh token rotation
```

Spring Security filter chain with:

```java
@Bean
SecurityFilterChain filterChain(HttpSecurity http) {
    return http
        .csrf(AbstractHttpConfigurer::disable)
        .sessionManagement(sm -> sm.sessionCreationPolicy(STATELESS))
        .authorizeHttpRequests(auth -> auth
            .requestMatchers("/api/v1/auth/**").permitAll()
            .anyRequest().authenticated()
        )
        .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)
        .build();
}
```

Why earlier:
- JWT + Spring Security is a top-3 Spring interview topic
- It changes how you design controllers (e.g., "whose sheets are these?")
- Adding auth later often requires refactoring service methods to accept a user context

---

### 31.3 Event-Driven Patterns (Application Events)

Add lightweight Spring Application Events for cross-cutting concerns:

```java
public record SheetMusicCreatedEvent(Long sheetId, String title) {}
public record FileUploadedEvent(Long fileId, String storageProvider) {}
public record SetlistDownloadedEvent(Long setlistId) {}
```

Listeners can handle:
- Audit logging
- Cache invalidation
- Analytics/statistics updates
- Future notification triggers

This demonstrates loose coupling and the Observer pattern â€” both valuable in interviews.

---

### 31.4 Full-Text Search

Plain `LIKE '%keyword%'` queries do not scale and miss relevance ranking.

#### Option A: PostgreSQL Native (simpler, recommended for Phase 1)

```sql
ALTER TABLE sheet_music ADD COLUMN search_vector tsvector;
CREATE INDEX idx_sheet_search ON sheet_music USING GIN(search_vector);
```

Spring Data JPA native query:

```java
@Query(value = "SELECT * FROM sheet_music WHERE search_vector @@ plainto_tsquery(:query)",
       nativeQuery = true)
Page<SheetMusic> fullTextSearch(@Param("query") String query, Pageable pageable);
```

#### Option B: Hibernate Search + Lucene (more powerful, Phase 6+)

```xml
<dependency>
    <groupId>org.hibernate.search</groupId>
    <artifactId>hibernate-search-mapper-orm</artifactId>
</dependency>
```

Supports faceting, fuzzy matching, and relevance scoring across multiple fields (title, artist, tags, notes).

---

### 31.5 Docker-First Developer Experience

The Docker Compose setup should be available from day one, not Phase 4.

Recommended `docker-compose.yml`:

```yaml
services:
  postgres:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: ScoreHub
      POSTGRES_USER: ScoreHub
      POSTGRES_PASSWORD: ScoreHub
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

  pgadmin:
    image: dpage/pgadmin4
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@local.dev
      PGADMIN_DEFAULT_PASSWORD: admin
    ports:
      - "5050:80"

volumes:
  pgdata:
```

README Quick Start:

```bash
git clone https://github.com/youruser/ScoreHub.git
cd ScoreHub
docker compose up -d
./mvnw spring-boot:run
```

Three commands to a working app â€” this impresses both interviewers and contributors.

---

### 31.6 Testing Enhancements

#### Use AssertJ (not just JUnit assertions)

AssertJ provides fluent, readable assertions:

```java
assertThat(result.getTitle()).isEqualTo("Sweet Child O' Mine");
assertThat(sheets).hasSize(3).extracting("artist").contains("Metallica");
```

#### Architecture Tests with ArchUnit

```java
@ArchTest
static final ArchRule servicesShouldNotDependOnControllers =
    noClasses().that().resideInAPackage("..service..")
        .should().dependOnClassesThat().resideInAPackage("..controller..");
```

This proves you think about architectural boundaries â€” very impressive in reviews.

#### Testcontainers from the Start

Instead of H2 for tests, use Testcontainers with PostgreSQL to catch database-specific bugs:

```java
@Testcontainers
@SpringBootTest
class SheetMusicRepositoryIT {
    @Container
    static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>("postgres:16-alpine");
}
```

---

### 31.7 GitHub Actions CI Pipeline

Add `.github/workflows/ci.yml` from Phase 1:

```yaml
name: CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_DB: ScoreHub_test
          POSTGRES_USER: test
          POSTGRES_PASSWORD: test
        ports:
          - 5432:5432
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with:
          java-version: '21'
          distribution: 'temurin'
      - run: ./mvnw verify
```

Add README badges:

```markdown
![Build](https://github.com/youruser/ScoreHub/actions/workflows/ci.yml/badge.svg)
![Java](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5-green)
```

---

### 31.8 Additional Interview-Worthy Features (Phase 2+)

| Feature | Technology | Why It Impresses |
|---------|-----------|-----------------|
| WebSocket setlist sharing | Spring WebSocket / STOMP | Real-time communication |
| Rate limiting | Bucket4j + Spring Filter | Production hardening |
| Response caching | Caffeine / Spring Cache | Performance optimization |
| Multi-tenancy | Hibernate Filters or schema-per-tenant | Enterprise SaaS pattern |
| Bulk export/import (ZIP) | Java ZipOutputStream + async processing | Batch processing |
| Metronome service | WebAudio API (frontend) | Domain creativity |
| Statistics dashboard | Practice hours, most played, streak | Data aggregation |
| Notifications | SSE (Server-Sent Events) | Push architecture |
| API key for external integrations | Custom auth filter | API platform thinking |
| OpenTelemetry / Micrometer metrics | Spring Actuator + Prometheus | Observability |

---

### 31.9 Revised Phase Recommendations

Based on the review, the recommended implementation order should shift slightly:

```text
Phase 1: Backend MVP
  - Sheet music CRUD + PDF upload/download
  - PostgreSQL + Docker Compose (not H2)
  - Flyway migrations (not ddl-auto)
  - Pagination on all list endpoints
  - Validation + Global exception handling
  - API versioning (/api/v1/)
  - Unit + controller tests
  - GitHub Actions CI
  - README with Quick Start

Phase 2: Domain Enrichment
  - Artists, Tags, Setlists, Backing Tracks
  - MapStruct mappers
  - Full-text search (PostgreSQL tsvector)
  - AssertJ + Testcontainers

Phase 3: Security
  - JWT authentication
  - Spring Security filter chain
  - User-scoped data access
  - Spring Data Auditing (@CreatedBy, etc.)

Phase 4: Production Polish
  - OpenAPI / Swagger UI
  - Error response standardization (RFC 7807 Problem Details)
  - Request logging (MDC correlation IDs)
  - Rate limiting
  - Caffeine caching

Phase 5: Web Frontend
  - Angular or React SPA
  - PDF viewer (PDF.js)
  - Audio player for backing tracks

Phase 6: Advanced Features
  - Offline setlist cache (PWA + Service Worker)
  - Cloud storage providers
  - Practice sessions + statistics
  - WebSocket real-time features
```

---

### 31.10 Quick Wins That Maximize Interview Impact

These are small additions with outsized impression value:

1. **RFC 7807 Problem Details** for error responses (Spring Boot 3 supports this natively via `spring.mvc.problemdetails.enabled=true`)
2. **Request/Response logging with MDC** â€” add a correlation ID filter that logs every request with a unique trace ID
3. **Health endpoint customization** â€” extend `/actuator/health` with storage connectivity check
4. **Profile-based config** â€” `application-dev.yml`, `application-prod.yml`, `application-test.yml`
5. **Lombok** (optional, controversial) â€” or use Java 21 Records for DTOs where possible
6. **`.editorconfig` + Checkstyle/SpotBugs** â€” shows code quality awareness
7. **Git hooks (pre-commit)** â€” format check before committing
8. **CHANGELOG.md** â€” maintain a changelog following Keep a Changelog format

---

### 31.11 Domain Model Relationship Diagram

Recommended entity relationships for reference:

```text
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”       â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   Artist    â”‚â”€â”€1:Nâ”€â”€â”‚ SheetMusic   â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜       â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                             â”‚
            â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
            â”‚                â”‚                â”‚
     â”Œâ”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”
     â”‚ BackingTrack â”‚  â”‚StoredFileâ”‚  â”‚   Tag (M:N)   â”‚
     â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                             â”‚
                      â”Œâ”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”
                      â”‚ SetlistItem  â”‚
                      â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                             â”‚
                      â”Œâ”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”
                      â”‚   Setlist    â”‚
                      â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

Key relationship rules:
- Artist â†’ SheetMusic: One-to-Many (one artist has many sheets)
- SheetMusic â†’ Tag: Many-to-Many (join table `sheet_music_tags`)
- SheetMusic â†’ BackingTrack: One-to-Many
- SheetMusic â†’ StoredFile: One-to-One (the PDF)
- Setlist â†’ SetlistItem â†’ SheetMusic: ordered Many-to-Many through join entity

---

