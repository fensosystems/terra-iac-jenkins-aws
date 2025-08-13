pipeline{
    agent any
    parameters{
        choice(name: "ACTION", choices: ["destroy", "apply"], description: "select terraform action to perform on resource")
        booleanParam(name: "Proceed", defaultValue: false, description: "Proceed?")
    }
    stages{
        stage('checkout from GIT'){
            steps{
               git branch: 'main', url: 'https://github.com/fensosystems/terra-iac-jenkins-aws'
            }
        }

        stage('Terraform plan') {
                when {
                    expression { return params.Proceed }
                }
                agent {
                    docker {
                        image 'node:18-alpine'
                        //image 'zenika/terraform-aws-cli'
                        reuseNode true
                    }
                }
                steps {
                    sh '''
                        echo 'with DOCKER'
                        terraform apply --auto-approve
                        aws --version
                        ls -la
                    '''
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