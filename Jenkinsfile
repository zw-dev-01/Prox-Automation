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
          /*     sh 'export PM_PASS=$PM_PASS'*/
         /*       sh 'mkdir .ssh'
                echo '$PRIV_SSH >.ssh/mydev'
                echo '$PUB_SSH >.ssh/mydev.pub'
                */
                
                sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM -var priv_key=$PRIV_SSH -var pub_key=$PUB_SS'
            }
        }
        stage('Deploy') {
            steps {
                sh 'terraform apply -var ssh_password=$ENV_LAB_SSH_VM -var priv_key=$PRIV_SSH -var pub_key=$PUB_SSH  -auto-approve'
            }
        }
    }
}

