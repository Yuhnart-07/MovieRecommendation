# Movie Recommendation - Docker

Project nay chay bang Docker Compose. Docker se build ung dung Spring Boot, tao PostgreSQL container, import database, va expose web app tai `http://localhost:8080`.

## Yeu Cau

- Docker Desktop dang chay.
- File `database-local.sql` nam o thu muc goc project.
- Port mac dinh:
  - App: `8080`
  - PostgreSQL tu may host: `5433`

Khong can cai PostgreSQL local, DBeaver, pgAdmin, hay import database thu cong.

## Chay Project

Tai thu muc goc project, chay:

```powershell
docker compose up --build
```

Lan dau tien Docker se:

1. Tai image PostgreSQL.
2. Tao database `movierecommendation`.
3. Import `database-local.sql`.
4. Build app Spring Boot tu `Dockerfile`.
5. Chay app tai `http://localhost:8080`.

Sau khi thay app start xong, mo:

```text
http://localhost:8080
```

## Dung Project

```powershell
docker compose down
```

## Reset Database

Neu muon xoa database Docker va import lai tu dau:

```powershell
docker compose down -v
docker compose up --build
```

Luu y: `docker compose down -v` se xoa volume database local cua Docker.

## Thong Tin Ket Noi

App:

```text
http://localhost:8080
```

PostgreSQL trong Docker network:

```text
Host: db
Port: 5432
Database: movierecommendation
Username: postgres
Password: postgres
```

PostgreSQL tu may host, neu can mo bang DBeaver hoac cong cu DB khac:

```text
Host: localhost
Port: 5433
Database: movierecommendation
Username: postgres
Password: postgres
```

## API Key Tuy Chon

App van chay duoc khi de trong cac key nay. Chi can khai bao khi dung tinh nang AI, TMDB, hoac mail.

```powershell
$env:OPENAI_API_KEY="..."
$env:TMDB_API_KEY="..."
$env:BREVO_API_KEY="..."
$env:APP_MAIL_FROM="noreply@movierec.local"
docker compose up --build
```

## Cau Truc Docker

```text
Dockerfile                         Build Spring Boot app image
docker-compose.yml                 Chay app + PostgreSQL
database-local.sql                 Dump database duoc Docker import
docker/postgres/99-init-complete.sql
                                  Danh dau import DB da xong
```

## Cau Truc Project

```text
src/main/java/com/example/movierecommendation
  algorithm/                       Recommendation engine
  config/                          Spring config, security, cache
  controller/                      Web controllers and API endpoints
  dto/                             Request/response DTOs
  entity/                          JPA entities
  repository/                      Spring Data repositories
  service/                         Business logic

src/main/resources
  application.properties           Docker runtime config
  application-prod.properties      Docker packaged/JAR config
  application.properties.example   Docker config template
  templates/                       Thymeleaf pages
  static/                          CSS/JS/assets
```
