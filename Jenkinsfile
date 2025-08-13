pipeline{
    agent any
    parameters{
        choice(name: "ACTION", choices: ["destroy", "apply"], description: "select terraform action to perform on resource")
    }
    stages{
        stage('checkout from GIT'){
            steps{
               git branch: 'main', url: 'https://github.com/fensosystems/terra-iac-jenkins-aws'
            }
        }
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform Apply'){
           steps{
                sh 'terraform ${ACTION} --auto-approve'
           }
        }
    }   
}