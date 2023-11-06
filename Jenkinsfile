pipeline {
    agent any
    environment {
        ENV_LAB_SSH_VM = credentials('lab-ssh-vm')
        ENV_LAB_NODE = credentials('LAB-NODE')
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
                sh 'terraform plan -var ssh_password={ENV_LAB_SSH_VM} -var PM_PASS={ENV_LAB_NODE'}
            }
        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
