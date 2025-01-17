# simple-nodejs-cicd-app

## Overview
A very simple Node.js web application with a complete CI/CD pipeline to demonstrate modern DevOps practices.  
This project implements the following features:
- **Build and Push**: Automates the build of a Docker image and pushes it to Docker Hub.
- **Deployment**: Deploys the application to a Kubernetes cluster using Minikube.
- **Monitoring**: Integrates Prometheus for real-time application monitoring.
- **Alerting**: Configures Alertmanager with Ansible for advanced alerting and monitoring.

---

## Features
- Create, read, update, and delete text via this application.
- Fully automated CI/CD pipeline with Jenkins.
- Dockerized application for seamless deployment.
- Kubernetes-based deployment using Minikube.
- Advanced monitoring and alerting with Prometheus and Alertmanager.

---

## Getting Started

### Prerequisites
Ensure the following are installed on your machine:
1. [Node.js](https://nodejs.org/)
2. [Docker](https://www.docker.com/)
3. [Jenkins](https://www.jenkins.io/)
4. [Minikube](https://minikube.sigs.k8s.io/docs/)
5. [kubectl](https://kubernetes.io/docs/tasks/tools/)
6. [Prometheus](https://prometheus.io/)
7. [Ansible](https://www.ansible.com/)

---

### Local Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/SaifeddineBENZAIED/simple-nodejs-cicd-app.git
   cd simple-nodejs-cicd-app
Install dependencies:
bash
Copier
Modifier
npm install
Run the application:
bash
Copier
Modifier
npm start
Access the application at http://localhost:3000.
CI/CD Pipeline Setup
1. Jenkins Pipeline
Add the provided Jenkinsfile to Jenkins.
Configure the pipeline with the following steps:
Build the Docker image.
Push the image to Docker Hub.
2. Build Docker Image
Run the following commands manually or via Jenkins:

bash
Copier
Modifier
docker build -t your-dockerhub-username/simple-nodejs-app:latest .
docker push your-dockerhub-username/simple-nodejs-app:latest
3. Deploy to Kubernetes
Apply the Kubernetes manifests in the k8s/ directory:
bash
Copier
Modifier
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Verify deployment:
bash
Copier
Modifier
kubectl get pods
kubectl get services
Monitoring with Prometheus
Deploy Prometheus using Helm or Kubernetes manifests.
Configure Prometheus to scrape metrics from the application.
Deploy Alertmanager with Ansible:
Use the provided Ansible playbook to configure Alertmanager.
Execute the playbook:
bash
Copier
Modifier
ansible-playbook alertmanager-playbook.yaml
Notes
User Interface: Rough but functional; planned improvements.
Security: Basic level; enhancements are planned.
Purpose: To review and demonstrate Node.js, CI/CD pipelines, containerization, and monitoring.
References
Opentutorials Node.js courses for beginners
Official Node.js API documentation
Prometheus Documentation
Contribution
Feel free to contribute by submitting a pull request. Suggestions for improvements, additional features, or bug fixes are welcome.

License
This project is licensed under the MIT License.

markdown
Copier
Modifier

### Highlights of this README:
1. **Clear Project Goals**: Describes the purpose and features of the repository concisely.
2. **Comprehensive Setup Instructions**: Includes steps for local setup, CI/CD pipeline, and monitoring.
3. **Structured Sections**: Organized into prerequisites, setup, and deployment for ease of use.
4. **Extensibility**: Encourages contributions and highlights areas for future improvement. 

This README provides a strong foundation for presenting your project on GitHub.
