pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = '717279727098'
        AWS_CREDENTIALS_ID = 'aws-cred'
        ECR_REPOSITORY = 'student-performance'
        REGION = 'us-east-1'
        CLUSTER_NAME = 'student-performance-cluster'
        SERVICE_NAME = 'student-performance-service'
        IMAGE_TAG = 'latest'
        DOCKER_IMAGE = ''
    }

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
                echo 'Workspace cleaned successfully.'
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/vipulwarthe/student-performance-ml-model-deployment-with-ECR-ECS.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    DOCKER_IMAGE = "${env.AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${ECR_REPOSITORY}:${IMAGE_TAG}"
                    sh """
                    docker build -t ${DOCKER_IMAGE} .
                    """
                }
            }
        }

        stage('Login to ECR') {
            steps {
                withAWS(credentials: AWS_CREDENTIALS_ID, region: REGION) {
                    sh """
                    aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${env.AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com
                    """
                }
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                sh """
                docker push ${DOCKER_IMAGE}
                """
            }
        }

        stage('Deploy to ECS') {
            steps {
                withAWS(credentials: AWS_CREDENTIALS_ID, region: REGION) {
                    sh """
                    aws ecs update-service --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --force-new-deployment
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed. Check logs for details.'
        }
    }
}
