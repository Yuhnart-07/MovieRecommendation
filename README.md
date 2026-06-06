# MovieRec - AI Movie Recommendation System

**He thong goi y phim thong minh** su dung **hybrid algorithm** (Content-based + Collaborative Filtering + Popularity) ket hop cac dich vu AI/API tuy chon de cung cap trai nghiem ca nhan hoa.

<div align="center">

[![Docker](https://img.shields.io/badge/Docker-Compose-blue?style=for-the-badge&logo=docker)](https://www.docker.com/)
[![Java](https://img.shields.io/badge/Java-21-orange?style=flat-square&logo=openjdk)](https://www.oracle.com/java/technologies/downloads/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.5-green?style=flat-square&logo=spring-boot)](https://spring.io/projects/spring-boot)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)](LICENSE)

</div>

---

## Muc Luc

- [Tinh Nang Chinh](#tinh-nang-chinh)
- [Tech Stack](#tech-stack)
- [Cai Dat](#cai-dat)
- [Chay Va Quan Ly Bang Docker](#chay-va-quan-ly-bang-docker)
- [Cau Truc Project](#cau-truc-project)
- [Team Workflow](#team-workflow)
- [Architecture](#architecture)
- [Ho Tro](#ho-tro)
- [License](#license)
- [Contributors](#contributors)

---

## Tinh Nang Chinh

### AI & Recommendation Engine

- **Hybrid Recommendation**: Ket hop Content-based, Collaborative Filtering va Popularity.
- **AI Recommendation**: Ho tro goi y phim theo ngu canh khi cau hinh API key.
- **Real-time Search**: Tim kiem phim voi goi y nhanh va lich su tim kiem.

### User Experience

- Xem trailer YouTube truc tiep trong ung dung.
- Xem chi tiet phim, poster, backdrop va thong tin lien quan.
- Danh gia va binh luan phim.
- Quan ly watchlist va lich su xem.
- Goi y phim theo hanh vi va so thich nguoi dung.

### Admin Features

- Dashboard quan ly noi dung.
- Quan ly phim, the loai va nguoi dung.
- Import/fetch du lieu phim tu TMDB khi cau hinh API key.
- Seed va quan ly du lieu danh gia, binh luan, lich su.

---

## Tech Stack

| Layer | Technology | Version |
|-------|------------|---------|
| Backend | Java, Spring Boot | 21 / 3.4.5 |
| Security | Spring Security, BCrypt | Latest |
| Frontend | Thymeleaf, HTML5, CSS3, JavaScript | Netflix-style |
| Database | PostgreSQL in Docker | 18 Alpine image |
| AI/ML | OpenAI API | Optional |
| External APIs | TMDB API | Optional |
| Build Tool | Gradle Wrapper | 8.x |
| Runtime | Docker, Docker Compose | Latest |

---

## Cai Dat

### Yeu Cau

- Docker Desktop dang chay.
- File `database-local.sql` nam o thu muc goc project.
- Port mac dinh:
  - App: `8080`
  - PostgreSQL tu may host: `5433`

Khong can cai PostgreSQL local, DBeaver, pgAdmin, hay import database thu cong.

### 1. Clone Repository

```bash
git clone <repository-url>
cd movierecommendation
```

### 2. Kiem Tra File Database

Dam bao thu muc goc project co file:

```text
database-local.sql
```

Docker Compose se tu import file nay vao PostgreSQL container trong lan chay dau tien.

### 3. Cau Hinh API Key Tuy Chon

App van chay duoc neu de trong cac key nay. Chi can khai bao khi dung tinh nang AI, TMDB hoac mail.

```powershell
$env:OPENAI_API_KEY="..."
$env:TMDB_API_KEY="..."
$env:BREVO_API_KEY="..."
$env:APP_MAIL_FROM="noreply@movierec.local"
docker compose up --build
```

### 4. Chay Application

```powershell
docker compose up --build
```

Sau khi app start xong, truy cap:

```text
http://localhost:8080
```

---

## Chay Va Quan Ly Bang Docker

### Start Project

```powershell
docker compose up --build
```

Lan dau tien Docker se:

1. Tai image PostgreSQL.
2. Tao database `movierecommendation`.
3. Import `database-local.sql`.
4. Build app Spring Boot tu `Dockerfile`.
5. Chay app tai `http://localhost:8080`.

### Stop Project

```powershell
docker compose down
```

### Reset Database

Neu muon xoa database Docker va import lai tu dau:

```powershell
docker compose down -v
docker compose up --build
```

Luu y: `docker compose down -v` se xoa volume database local cua Docker.

### Thong Tin Ket Noi Database

PostgreSQL trong Docker network:

```text
Host: db
Port: 5432
Database: movierecommendation
Username: postgres
Password: postgres
```

PostgreSQL tu may host neu can mo bang DBeaver hoac cong cu DB khac:

```text
Host: localhost
Port: 5433
Database: movierecommendation
Username: postgres
Password: postgres
```

---

## Cau Truc Project

```text
movierecommendation/
├── .github/workflows/
│   └── docker.yml                     # Docker CI workflow
├── docker/
│   └── postgres/
│       └── 99-init-complete.sql        # Danh dau import DB da xong
├── src/main/java/com/example/movierecommendation/
│   ├── algorithm/                      # Recommendation engine
│   ├── config/                         # Spring config, security, cache
│   ├── controller/                     # Web controllers va API endpoints
│   ├── dto/                            # Request/response DTOs
│   ├── entity/                         # JPA entities
│   ├── repository/                     # Spring Data repositories
│   ├── service/                        # Business logic
│   └── MovieRecommendationApplication.java
├── src/main/resources/
│   ├── application.properties          # Docker runtime config
│   ├── application-prod.properties     # Docker packaged/JAR config
│   ├── application.properties.example  # Docker config template
│   ├── templates/                      # Thymeleaf pages
│   └── static/                         # CSS/JS/assets
├── src/test/                           # Tests
├── build.gradle                        # Gradle build configuration
├── Dockerfile                          # Docker image definition
├── docker-compose.yml                  # App + PostgreSQL
├── database-local.sql                  # Database dump for Docker import
└── README.md
```

---

## Team Workflow

### Git Flow

```bash
# 1. Update code moi nhat
git pull origin main

# 2. Tao branch cho tinh nang hoac sua loi
git checkout -b feature/your-feature-name

# 3. Code va commit
git add .
git commit -m "Add feature description"

# 4. Push branch
git push origin feature/your-feature-name

# 5. Tao Pull Request tren GitHub va merge sau khi review
```

### Commit Message Convention

```text
feat: them tinh nang moi
fix: sua loi
docs: cap nhat tai lieu
style: dieu chinh giao dien hoac format
refactor: cai tien code khong doi hanh vi
test: them hoac sua test
chore: cap nhat cau hinh hoac cong cu
```

### Code Review Checklist

- Code dung pham vi task.
- Khong commit API key, password hoac secret that.
- Khong dua lai cau hinh deploy platform cu.
- Docker Compose van chay duoc voi `docker compose up --build`.
- Documentation duoc cap nhat neu thay doi cach chay project.

---

## Architecture

### Hybrid Recommendation Algorithm

```text
User Input
    |
    +--> Content-Based Filter
    |       Movie similarity, genre, metadata
    |
    +--> Collaborative Filtering
    |       User behavior, ratings, watch history
    |
    +--> Popularity Score
            Ratings, views, trending signals
    |
    v
Final Ranked Recommendations
```

### Docker Runtime Flow

```text
docker compose up --build
    |
    +--> PostgreSQL container
    |       Import database-local.sql
    |
    +--> Spring Boot app container
            Connect to jdbc:postgresql://db:5432/movierecommendation
            Serve app at http://localhost:8080
```

### Security Flow

```text
User Login
    |
Spring Security Filter Chain
    |
Session / Remember-me
    |
Role-Based Access Control
    |
Encrypted Password with BCrypt
```

---

## Ho Tro

### Report Bugs

1. Mo ta chi tiet loi.
2. Ghi ro cac buoc tai hien.
3. Neu loi lien quan Docker, gui them log container.
4. Neu co the, dinh kem screenshot.

**Lien he:** nhom phat trien hoac tao Issue tren GitHub.

### Documentation

- [Spring Boot Docs](https://spring.io/projects/spring-boot)
- [Docker Docs](https://docs.docker.com/)
- [TMDB API](https://developer.themoviedb.org/docs)
- [OpenAI API](https://platform.openai.com/docs)

### Security Issues

Khong cong khai bug bao mat. Hay lien he truc tiep voi nhom phat trien.

---

## License

MIT License - Xem file [LICENSE](LICENSE) de biet chi tiet.

---

## Contributors

| Role | Contact |
|------|---------|
| Project Team | MovieRec Development Team |
| Backend | Development Team |
| Frontend | Development Team |

---

<div align="center">

**Made by MovieRec Development Team**

</div>
