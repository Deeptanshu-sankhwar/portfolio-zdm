# Production Engineering - Week 1 - Portfolio Site

Welcome to the MLH Fellowship! During Week 1, you'll be using Flask to build a portfolio site. This site will be the foundation for activities we do in future weeks so spend time this week making it your own and reflect your personality!

## New Features Added

This portfolio now includes:
- **NGINX Reverse Proxy** with SSL/HTTPS support (using `user_conf.d/myportfolio.conf`)
- **Docker Containerization** for easy deployment
- **Production-ready Configuration** with security best practices
- **Health Check Endpoints** for monitoring
- **Automated SSL Certificate Management** using Let's Encrypt

## Tasks

Once you've got your portfolio downloaded and running using the instructions below, you should attempt to complete the following tasks.

For each of these tasks, you should create an [Issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues) and work on them in a new [branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches). When the task has been completed, you should open a [Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) and get another fellow in your pod to give you feedback before merging it in.

*Note: Make sure to include a link to the Issue you're progressing on inside of your Pull Request so your reviewer knows what you're progressing on!*

### GitHub Tasks
- [x] Create Issues for each task below
- [x] Progress on each task in a new branch
- [x] Open a Pull Request when a task is finished to get feedback

### Portfolio Tasks
- [x] Add a photo of yourself to the website
- [x] Add an "About yourself" section to the website.
- [x] Add your previous work experiences
- [x] Add your hobbies (including images)
- [x] Add your current/previous education
- [x] Add a map of all the cool locations/countries you visited

### Flask Tasks
- [x] Get your Flask app running locally on your machine using the instructions below.
- [x] Add a template for adding multiple work experiences/education/hobbies using [Jinja](https://jinja.palletsprojects.com/en/3.0.x/api/#basics)
- [x] Create a new page to display hobbies.
- [x] Add a menu bar that dynamically displays other pages in the app

### Production Engineering Tasks
- [x] Add NGINX reverse proxy configuration
- [x] Containerize the application with Docker
- [x] Add SSL/HTTPS support with automated certificate management
- [x] Implement health checks and monitoring endpoints
- [x] Optimize Dockerfile for production deployment
- [x] Add deployment automation scripts

## 🐳 Quick Start with Docker (Recommended)

The easiest way to run this portfolio is using our deployment script:

```bash
# Make the script executable (first time only)
chmod +x deploy.sh

# Start development environment
./deploy.sh dev

# Or start production environment
./deploy.sh prod

# Run tests
./deploy.sh test

# Stop all services
./deploy.sh stop
```

Your portfolio will be available at:
- **HTTP**: http://deeptanshu-portfolio.duckdns.org
- **HTTPS**: https://deeptanshu-portfolio.duckdns.org (after SSL setup)

## 📋 Prerequisites

- Docker and Docker Compose installed
- Git for version control

## 🔧 Manual Setup

### Environment Configuration

1. Copy the example environment file:
```bash
cp example.env .env
```

2. Edit `.env` with your configuration:
```env
URL=deeptanshu-portfolio.duckdns.org
MYSQL_HOST=mysql
MYSQL_USER=portfolio_user
MYSQL_PASSWORD=portfolio_password
MYSQL_DATABASE=portfolio_db
MYSQL_ROOT_PASSWORD=root_password
CERTBOT_EMAIL=your-email@example.com
```

### Development Environment

```bash
# Start all services
docker-compose up --build -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### Production Environment

```bash
# Start production services
docker-compose -f docker-compose.prod.yml up --build -d

# View logs
docker-compose -f docker-compose.prod.yml logs -f

# Stop services
docker-compose -f docker-compose.prod.yml down
```

## 🧪 Local Development (Without Docker)

If you prefer to run locally without Docker:

### Installation

Make sure you have Python 3.11+ and pip installed.

Create and activate virtual environment:
```bash
python -m venv python3-virtualenv
source python3-virtualenv/bin/activate  # On Windows: python3-virtualenv\Scripts\activate
```

Install dependencies:
```bash
pip install -r requirements.txt
```

### Usage

Create a .env file using the example.env template with appropriate local settings.

Start Flask development server:
```bash
export FLASK_ENV=development
flask run
```

You should get a response like this in the terminal:
```
❯ flask run
 * Environment: development
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

You'll now be able to access the website at `localhost:5000` or `127.0.0.1:5000` in the browser!

## 🏗️ Architecture

This portfolio uses a modern containerized architecture:

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│                 │    │                  │    │                 │
│  NGINX Proxy    │    │   Flask App      │    │   MySQL DB      │
│  (Port 80/443)  │────│   (Port 5000)    │────│   (Port 3306)   │
│                 │    │                  │    │                 │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

- **NGINX**: Reverse proxy with SSL termination and static file serving
- **Flask**: Python web application with Jinja2 templating
- **MySQL**: Database for timeline posts and user data
- **Docker**: Containerization for consistent deployments

## 🔒 Security Features

- Non-root user in Docker containers
- SSL/HTTPS with automatic certificate renewal
- Environment variable configuration
- Health check endpoints
- Security headers via NGINX

## 📊 Monitoring

Health check endpoints:
- **Application Health**: `GET /health`
- **NGINX Health**: `GET /health` (returns 200 OK)

## 🧪 Testing

Run the test suite:
```bash
./run_test.sh
```

Or with the deployment script:
```bash
./deploy.sh test
```

## Getting Started

- Deeptanshu: Initialized project and invited collaborators
- Zidanni: Setup up seperate pages including hobby page
- Zidanni: Setup navbar and routes
- Zidanni: Added personal photo
- Zidanni: Added personal about me + styling
- Zidanni: Added personal map + styling
- Zidanni, Manav, Deeptanshu: Reviewed exising PRs on call and merged
- Zidanni: Fixed the navbar to make it dynamically display pages
- Deeptanshu: Reviewed and Approved Zidanni's dyamic navbar PR
- Deeptanshu: Added personal photo, about me + styling, personal map + styling
- Manav: Added personal photo, about me, personal map
- Manav: Merged profile pages into one re-usable component, integrated jinja for components
- Manav, Zidanni, Deeptanshu: Reviewed and approved PRs
- Zidanni: Fixed jinja template styling to include date and company
- Manav: Added hobbies page with jinja template
- Manav: Created styling to dynamically include hobby data
- Manav: Added personal work experiences
- Manav: Added personal education
- Manav: Added personal hobby information
- Zidanni: Added personal work experiences
- Zidanni: Added personal education
- Zidanni: Added personal Hobbies
- Deeptanshu: Added personal work experiences
- Deeptanshu: Added personal education
- Deeptanshu: Added personal Hobbies

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## 📝 License

This project is part of the MLH Fellowship Production Engineering track.
