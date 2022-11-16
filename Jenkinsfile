pipeline{
    agent any
    tools {
        terraform 'Terraform'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/dcanosu/Terraform'
            }   
        }
        stage('Terraform init'){
            steps{
                sh label: '', script: 'terraform init'
            }
        }
#        stage('Terraform Apply'){
#            steps{
#                sh label: '', script: 'terraform apply --auto-approve'
#            }
#        }
          stage('Terraform Destroy'){
            steps{
                sh label: '', script: 'terraform destroy --auto-approve'
            }
        }
    }
}
