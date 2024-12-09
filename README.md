# HelloWorld Python Web Application
This is a simple web application built using Flask that displays "Hello World" on the main page. The project demonstrates how to set up a basic Flask app, Dockerize it, and deploy it using CI/CD through GitHub Actions to an EC2 instance.

## Features
- A minimal Flask web application.
- Displays "Hello World" on the homepage.
- Uses Docker to containerize the application.
- CI/CD pipeline with GitHub Actions to build, push the Docker image, and deploy to EC2.

## How It Works

1. **Flask Web Application (app.py)**:
   The `app.py` file contains the Flask web application. When you access the root URL (`/`), it renders an `index.html` file that displays "Hello World".

2. **Dockerization**:
   The `Dockerfile` describes how to build the Docker image for the application:
   - It uses the official `python:3.12-slim` image.
   - It installs the required Python packages (`flask` and `werkzeug`).
   - It exposes port 5000 for the Flask application.

3. **CI/CD with GitHub Actions**:
   - The `.github/workflows/devops.yml` file defines a GitHub Actions pipeline to automate building and deploying the application.
   - When code is pushed to the `main` branch, the pipeline:
     - Builds and pushes the Docker image to Docker Hub (`paito16/helloworldpython`).
     - Deploys the application to an EC2 instance by connecting via SSH, stopping any existing containers on port 5000, and running the new Docker container.

4. **Deployment**:
   - The application is deployed to an EC2 instance using SSH.
   - The pipeline installs Docker on the EC2 instance, pulls the latest Docker image from Docker Hub, and runs the container.

## Setup Instructions

### Prerequisites

- Docker installed on your local machine (for building and testing the container).
- A GitHub account and repository with your project.
- Docker Hub account for pushing the image.
- An AWS EC2 instance for deployment.

### Running the Application Locally

1. Clone the repository to your local machine:
```bash git clone https://github.com/yourusername/helloworldpython.git cd helloworldpython ```
2. Build the Docker image: 
```bash docker build -t helloworldpython . ```
3. Run the application in a container: 
```bash docker run -p 5000:5000 helloworldpython ```
4. Open your browser and navigate to `http://localhost:5000`. You should see the "Hello World" message.

### Deploying to EC2

1. Ensure you have the necessary secrets (Docker Hub credentials and EC2 details) stored in GitHub Secrets: - `DOCKER_USER` (your Docker Hub username). - `DOCKER_PASS` (your Docker Hub password). - `EC2_HOST` (your EC2 instance's public IP address). - `EC2_SSH_USER` (the SSH username for your EC2 instance normaly ubuntu). - `EC2_SSH_KEY` (the private key for SSH access to your EC2 instance).
2. When you push changes to the `main` branch, the GitHub Actions pipeline will automatically build the Docker image, push it to Docker Hub, and deploy it to your EC2 instance.
