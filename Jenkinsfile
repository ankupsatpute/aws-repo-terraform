pipeline{
    agent any 
    environment {
      PATH = "/opt/apache-maven-3.8.7/bin/:$PATH"
      //----------------Nexus Credentails---------
      def CRDID = 'Nexus'
      def NXURL = '43.205.199.218:8081'
      def NXVRN = 'nexus3'
      def PROTO = 'http'
      def REPO  = 'sample'
      }
    tools {
  terraform 'terraform'
    }
    stages{
        stage('git Checkout'){
            steps{
                git branch :'main', url: 'https://github.com/ankupsatpute/aws-repo-terraform.git'
            }
        }
       /* stage('Build'){
            steps{
                sh "mvn package"
            }
        }
         stage('Upload the Artifact'){
            steps{
                script{
                  def mavenPom = readMavenPom file: 'pom.xml'
                  
                    nexusArtifactUploader artifacts:[
                     [artifactId: "${mavenPom.artifactId}",
                     classifier: '', 
                     file: "target/${mavenPom.artifactId}-${mavenPom.version}.${mavenPom.packaging}",
                     type: "${mavenPom.packaging}"]
                     ],
                     credentialsId: "${env.CRDID}",
                     groupId: "${mavenPom.groupId}",
                     nexusUrl: "${env.NXURL}",
                     nexusVersion: "${env.NXVRN}", 
                     protocol: "${env.PROTO}", 
                     repository: "${env.REPO}", 
                     version: "${mavenPom.version}"
                 }
            }
        }
    stage('Terraform INIT'){
        steps{
            sh "terraform init"
        }
       }
    stage('Terraform Apply'){
        steps{
            sh "terraform apply --auto-approve"
            //sleep(10)
          }
      }*/
    stage('Ansible Deploy'){
        steps{
            ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.ini', playbook: 'TOMCATSETUP.yml'
        }
      }
    }

}
