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
                echo 'Plan..'
                sh "terraform plan -var ssh_password=credentials('lab-ssh-vm')-var PM_PASS=credentials('LAB-NODE')"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
