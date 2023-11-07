pipeline {
    agent any
    environment {
        ENV_LAB_SSH_VM = credentials('lab-ssh-vm')
        PM_PASS = credentials('LAB-NODE')
        PRIV_SSH = credentials('PRIV_SSH')
        PUB_SSH = credentials('PUB_SSH')      
    }
    
    stages {
        stage('Initialize') {
            steps {
                dir('terraform'){
                    echo 'Building the file'
                    sh 'terraform init'
                }
            }
        }
        stage('Plan') {
            steps {
                echo 'Plan..'
                dir('terraform'){
                    script{
                        writeFile(file: 'mydev.pub', text: PUB_SSH,encoding: "UTF-8")
                        //writeFile(file: 'mydev2', text: PRIV_SSH,encoding: "UTF-8")
                        withCredentials([file(credentialsId: 'PRIV_SSH_FILE', variable: 'mydev_tmp')]) {
                        sh 'ls -la'
                        sh 'cp $mydev_tmp mydev'
                        //sh 'cat mydev.pub'
                        sh 'chmod 600 mydev'
                       /* sh 'mkdir .ssh'*/
                        sh 'terraform plan -var ssh_password=$ENV_LAB_SSH_VM'
                        }
                        //sh 'rm my*.*'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('terraform'){
                    withCredentials([file(credentialsId: 'PRIV_SSH_FILE', variable: 'mydev')]) {
                        sh 'chmod 600 mydev'
                        sh 'ls -la'
                        sh 'terraform apply -var ssh_password=$ENV_LAB_SSH_VM -auto-approve'
                    
                    }
                }
            }
        }
    }
}

