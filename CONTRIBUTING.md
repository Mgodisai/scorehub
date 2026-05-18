# Contributing & Development Strategy

## Branch Strategy: GitHub Flow

This project uses **GitHub Flow** — a simple, single-branch strategy ideal for continuous delivery.

```
main (always stable, deployable)
  ├── feature/1-project-init
  ├── feature/4-sheetmusic-entity
  ├── fix/12-pagination-bug
  └── docs/update-readme
```

### Rules

1. **main is always deployable** — never push directly to main
2. **All work happens on feature branches** created from main
3. **Branch naming convention:** `<type>/<issue-number>-short-description`
   - `feature/4-sheetmusic-entity`
   - `fix/12-pagination-bug`
   - `docs/update-api-examples`
   - `refactor/15-extract-base-entity`
   - `test/9-integration-tests`
4. **Pull Requests are mandatory** — every merge to main goes through a PR
5. **Delete branch after merge** — keep the repo clean

### Workflow

```bash
# 1. Start from latest main
git checkout main && git pull

# 2. Create feature branch (reference issue number)
git checkout -b feature/4-sheetmusic-entity

# 3. Work, commit frequently with conventional commits
git commit -m "feat: add SheetMusic JPA entity (#4)"

# 4. Push and open PR
git push -u origin feature/4-sheetmusic-entity
gh pr create --title "feat: SheetMusic entity and repository" --body "Closes #4"

# 5. After merge, clean up
git checkout main && git pull
git branch -d feature/4-sheetmusic-entity
```

---

## Commit Convention: Conventional Commits

All commits follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```
<type>: <description> (#<issue-number>)

[optional body]
```

### Types

| Type | When to use |
|------|-------------|
| feat | New feature or functionality |
| fix | Bug fix |
| docs | Documentation only changes |
| refactor | Code change that neither fixes a bug nor adds a feature |
| test | Adding or updating tests |
| chore | Build process, dependencies, tooling |
| style | Formatting, missing semicolons (no logic change) |
| perf | Performance improvement |
| ci | CI/CD pipeline changes |

### Examples

```
feat: add SheetMusic CRUD endpoints (#5)
fix: correct pagination offset for zero-based index (#12)
docs: add API usage examples to README
refactor: extract BaseEntity for auditing fields (#4)
test: add Testcontainers integration tests (#9)
ci: add GitHub Actions workflow with PostgreSQL service (#1)
chore: update Spring Boot to 3.5.1
```

---

## Versioning: Semantic Versioning

This project uses [Semantic Versioning](https://semver.org/) with Git tags at milestone completion.

### Format: MAJOR.MINOR.PATCH

| Version | Meaning |
|---------|---------|
| 0.1.0 | Phase 1 complete — Backend MVP |
| 0.2.0 | Phase 2 complete — Domain Enrichment |
| 0.3.0 | Phase 3 complete — Security |
| 0.4.0 | Phase 4 complete — Production Polish |
| 0.5.0 | Phase 5 complete — Web Frontend |
| 1.0.0 | First full release (all phases complete) |

### Tagging

```bash
# After merging the last PR of a phase:
git tag -a v0.1.0 -m "Phase 1: Backend MVP complete"
git push origin v0.1.0
```

---

## Issue Management

### Labels

| Label | Color | Purpose |
|-------|-------|---------|
| feature | green | New functionality |
| enhancement | blue | Improvement to existing feature |
| bug | red | Bug fix |
| docs | yellow | Documentation |
| infra | light blue | CI/CD, Docker, build config |
| testing | light blue | Test coverage |
| security | peach | Auth, authorization |
| phase-1 to phase-6 | purple shades | Phase tracking |

### Milestones

Each phase has a milestone. Issues are assigned to milestones to track progress.

### Issue Linking

- Reference issues in commits: `feat: add entity (#4)`
- Auto-close issues in PRs: `Closes #4` in PR description
- Reference related issues: `Related to #3`

---

## CI/CD Pipeline

- **Trigger:** Every push to main and every PR
- **Steps:** Build → Test → (future: Deploy)
- **Requirement:** All checks must pass before PR merge
- **PostgreSQL:** Service container for integration tests

---

## Development Order (Phase 1)

Issues should be tackled roughly in this order (dependencies):

```
#1 Project initialization + CI pipeline
 └── #2 Docker Compose setup
      └── #3 Flyway migrations
           └── #4 SheetMusic entity
                └── #5 CRUD REST API
                     ├── #6 Pagination & sorting
                     └── #7 Validation & error handling
#9 Tests (ongoing, finalize after #5-#7)
```

---

## For AI Agents

When working on this project, follow these rules:

1. **Always create a feature branch** — never commit to main directly
2. **Reference the issue number** in branch name and commits
3. **Use conventional commits** exactly as specified above
4. **Run tests before pushing** — `./mvnw verify`
5. **One issue = one PR** — keep changes focused
6. **Update docs** if your change affects the API or setup process
7. **Follow existing code patterns** — check how similar code is written in the project