pipeline {
    agent any
    environment {
        ENV-LAB-SSH-VM = credentials('lab-ssh-vm')
        ENV-LAB-NODE = credentials('LAB-NODE')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building the file'
                 sh 'terraform init'
            }
        }
        stage('Test') {
            steps {
                echo 'Plan..'
                sh 'terraform plan -var ssh_password=${ENV-LAB-SSH-VM}-var PM_PASS=${ENV-LAB-NODE'}
            }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
