pipeline {
    agent any
    environment {
        ENV_LAB_SSH_VM = credentials('lab-ssh-vm')
        PM_PASS = credentials('LAB-NODE')
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
                echo '$PM_PASS'
                echo '$ENV_LAB_SSH_VM'
                sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

