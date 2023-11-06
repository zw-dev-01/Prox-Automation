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
          /*     sh 'export PM_PASS=$PM_PASS'*/
                echo '${PM_PASS}'
                sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM -auto-approve'
            }
        }
        stage('Deploy') {
            steps {
                sh 'terraform apply -var ssh_password=$ENV_LAB_SSH_VM -auto-approve'
            }
        }
    }
}

