pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'saif1920/nodejs-web-app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/SaifeddineBENZAIED/nodejs_web-app.git'
            }
        }

        stage('Test Docker Access') {
            steps {
                sh 'docker --version'
                sh 'docker ps'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml --kubeconfig=E:/.minikube/machines/minikube/config.json'
                sh 'kubectl apply -f service.yaml --force --kubeconfig=E:/.minikube/machines/minikube/config.json'
            }
        }

        stage('Configure Monitoring with Prometheus') {
            steps {
                script {
                    sh 'helm repo add prometheus-community https://prometheus-community.github.io/helm-charts'
                    sh 'helm repo update'
                    sh 'helm install prometheus prometheus-community/prometheus'
                }
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                script {
                    docker.image('ansible/ansible:latest').inside {
                        sh '''
                        ansible --version
                        ansible-playbook -i inventory.yml playbook.yml
                        '''
                    }
                }
            }
        }

        stage('Monitor Application with Prometheus') {
            steps {
                echo 'Monitoring application with Prometheus...'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/logs/*.log', allowEmptyArchive: true
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
