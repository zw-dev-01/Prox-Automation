pipeline {
    agent any
    environment {
        ENV_LAB_SSH_VM = credentials('lab-ssh-vm')
        PM_PASS = credentials('LAB-NODE')
        PRIV_SSH = credentials('PRIV_SSH')
        PUB_SSH = credentials('PUB_SSH')      
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building the file'
                sh 'terraform init'
                sh 'echo ${PRIV_SSH} > mydev'
                sh 'echo ${PUB_SSH} > mydev.pub'
                script {
                    def output = sh(returnStdout: true, script: 'cat mydev.pub').trim()
                    echo ${output}'
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Plan..'
   
               /* sh 'mkdir .ssh'*/
                sh 'echo ${PRIV_SSH} > mydev'
                sh 'echo ${PUB_SSH} > mydev.pub'
                sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM'
            }
        }
        stage('Deploy') {
            steps {
                sh 'terraform apply -var ssh_password=$ENV_LAB_SSH_VM -auto-approve'
            }
        }
    }
}

