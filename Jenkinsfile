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

            }
        }
        stage('Test') {
            steps {
                echo 'Plan..'
                script{
                    writeFile(file: 'mydev.pub', text: PUB_SSH,encoding: "UTF-8")
                    writeFile(file: 'mydev', text: PRIV_SSH,encoding: "UTF-8")
                    sh 'ls -la'
                    sh 'pwd'
                    sh 'cat mydev.pub'
                    sh 'cat mydev'
                    sh 'chmod 600 mydev'
               /* sh 'mkdir .ssh'*/
                    sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'terraform apply -var ssh_password=$ENV_LAB_SSH_VM -auto-approve'
            }
        }
    }
}

