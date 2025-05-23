pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the source code from your version control system (e.g., Git)
                git branch: 'main', url: 'https://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@github.com/oalamad/dateTime.git'
            }
        }

        stage('Build') {
            steps {
                // Use Maven to build the Spring Boot application
                sh 'mvn clean install' // You can replace 'package' with your desired Maven goals
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archive the JAR or WAR file generated by Maven
                archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Set your Docker image name and tag
                    def dockerImage = 'oalamad/awsdatetime'
                    def dockerTag = 'latest'
                    sh 'echo $WORKSPACE'
                    def jarFile = sh(script: 'ls -d $WORKSPACE/target/*.jar', returnStdout: true).trim()
                    echo "Jar File: ${jarFile}"
                    // Build the Docker image
                    sh "docker build -t $dockerImage:$dockerTag --build-arg JAR_FILE=$jarFile ."
                    sh "docker push $dockerImage:$dockerTag"
                }
            }
        }


        stage('Deploy to Kubernetes') {
            steps {
               script {
                   // Set the Kubernetes namespace
                   def namespace = 'date-time'
                   
                   // Define the deployment YAML file path
                   def deploymentYaml = './deployment.yml'
                   sh "pwd && ls"
                   // Apply the deployment to the Kubernetes cluster
                   sh "kubectl apply -n $namespace -f $deploymentYaml"
               }
            }
        }
    }

    post {
        success {
            // Add post-build actions here (e.g., deployment)
            sh 'echo "build succeeded"'
        }
    }
}
