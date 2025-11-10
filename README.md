# DevOps Capstone Project

Project Description

This project demonstrates a fully automated CI/CD pipeline using Jenkins, Docker, and AWS EC2 instances. It includes continuous integration triggered by GitHub commits, containerized deployment via Docker, and real-time monitoring using Prometheus and Grafana. The pipeline also features automated backup and cleanup tasks using crontab jobs.

Tech Stack
- Version Control: GitHub
- CI/CD: Jenkins
- Containerization: Docker, Docker Hub
- Cloud Infrastructure: AWS EC2
- Monitoring: Prometheus, Grafana, Node Exporter
- Automation: Crontab (Bash scripts)

Setup Instructions (Local Build & Run)
1. Clone the Repository

git clone https://github.com/Sarwesh0910/devops-capstone.git
cd devops-capstone

2. Build Docker Image
docker build -t $IMAGE_NAME:latest

3. Install Node Exporter (on EC2)
wget https://github.com/prometheus/node_exporter/releases/download/v*/node_exporter-*-linux-amd64.tar.gz
tar xvfz node_exporter-*-linux-amd64.tar.gz
./node_exporter &

4. Configure Prometheus to Scrape Metrics
Edit prometheus.yml:
- job_name: 'node_exporter'
  static_configs:
    - targets: ['<App_EC2_IP>:9100']

CI/CD Flow Overview
- Code Push: Developer pushes code to GitHub.
- Build Trigger: Jenkins (on EC2_instance_1) triggers on commit.
- Docker Build & Push: Jenkins builds Docker image and pushes it to Docker Hub.
- Deployment: Jenkins SSHs into EC2_instance_2 and deploys the container.
- Monitoring: Node Exporter scrapes metrics from EC2_instance_2. Prometheus (on EC2_instance_3) collects them, and Grafana visualizes them.
- Automation: Crontab job on EC2_instance_2 runs scheduled backup and cleanup scripts.




