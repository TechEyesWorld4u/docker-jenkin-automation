pipeline {
    environment {
    registry = 'techeyesworld/learninghub-image'
    registryCredential = 'Docker-Hub-Cred'
    dockerImage = ''
   }
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven_3_8_6"
    }

    stages {
        stage('Maven Build') {
            steps {
                // Get some code from a GitHub repository
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TechEyesWorld4u/docker-jenkin-automation']])

                // Run Maven on a window agent.
                bat 'mvn clean install'

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Build docker image'){
			steps{
				script{
				dockerImage = docker.build registry
				}
			}
		}
		stage('Push image to hub'){
			steps{
				script{
					//withCredentials([string(credentialsId: 'Docker-Hub-Cred', variable: 'Docker-Hub-Cred')]) {
					docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
				}
				//bat 'docker push techeyesworld/learninghub-image'
				}
			}
		}
    }
}

