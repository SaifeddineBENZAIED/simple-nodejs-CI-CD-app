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

        stage('Install kubectl') {
            steps {
                sh '''
                curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                chmod +x kubectl
                mkdir -p /var/jenkins_home/tools
                mv kubectl /var/jenkins_home/tools/
                export PATH=$PATH:/var/jenkins_home/tools
                kubectl version --client
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig(credentialsId: 'kubeconfig-credentials_id') {
                    sh '''
                    echo "=== deployment.yaml ==="
                    cat deployment.yaml
                    echo "Validating deployment.yaml..."
                    python3 -c "import yaml, sys; yaml.safe_load(sys.stdin)" < deployment.yaml || exit 1
        
                    echo "=== service.yaml ==="
                    cat service.yaml
                    echo "Validating service.yaml..."
                    python3 -c "import yaml, sys; yaml.safe_load(sys.stdin)" < service.yaml || exit 1
        
                    echo "Applying resources to Kubernetes..."
                    kubectl apply -f deployment.yaml || echo "Deployment failed!"
                    kubectl apply -f service.yaml || echo "Service failed!"
                    '''
                }
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
