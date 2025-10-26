pipeline {
    agent any
    environment {
        DOCKERHUB_REPO = 'hortensehouendji/welcome-jenkins'
        DOCKERHUB_CREDS = credentials('DockerHubCreds-id')
    }

    stages {
        stage('Source') {
            steps {
                echo 'logging into github'
                git branch: 'main', credentialsId: 'GithubCreds-id', url: 'https://github.com/hortensesigue/welcome-jenkins-april2025.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'building docker image'
                sh 'whoami'
                sh 'docker build -t ${DOCKERHUB_REPO}:v${BUILD_NUMBER} .'
                sh 'docker images'
                //sh 'docker run --name testing -dit -p 80:80 ${DOCKERHUB_REPO}:v${BUILD_NUMBER} '
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'deploying the docker image to dockerhub'
                sh 'docker login -u ${DOCKERHUB_CREDS_USR} -p ${DOCKERHUB_CREDS_PSW}'
                sh 'docker push ${DOCKERHUB_REPO}:v${BUILD_NUMBER}'
            }
        }
    }
}
