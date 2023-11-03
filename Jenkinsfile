pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the file'
                 sh 'terraform init'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'terraform plan'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
