pipeline {
    agent any
    parameters {
        choice(
            name: 'AWS_EC2_TYPE',
            choices: ['t2.micro', 't2.medium','t2.large'],
            description: ''
        )
    }
    stages {
        stage('git clone') {
            steps {
              git branch: 'main', url: "https://github.com/sajjavenkey50/terraform_ec2.git" 
              sh "ls -ll"
            }
        }
        
        stage('terraform init') {
            steps {
              sh "terraform init -no-color" 
            }
        }
        stage('terraform plan') {
            steps {
                script {
                   def  ec2type= params.AWS_EC2_TYPE
                    println ec2type
                    sh  "ls -ll"
                    sh "pwd"
                    sh "export TF_LOGS=trace"
                    sh "terraform plan -var 'type=${params.AWS_EC2_TYPE}' -no-color" 
                }
            }
        }
        stage('terraform apply') {
            steps {
              sh "terraform apply -var 'type=${params.AWS_EC2_TYPE}' -no-color --auto-approve"
            }
        }
    } 
}    

