pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the file'
                 sh 'terraform init'
            }
        }
        stage('Plan') {
            steps {
                echo 'Testing..'
                terraform plan
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
