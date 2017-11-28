pipeline {
	agent any
	
	stages {
		
		stage('Git Pull') {
			steps {
			    checkout scm
			}
		}

		stage('Build image') {
			steps {
				app = docker.build("localhost:5000/mypython")
			}
		}

		stage('Test image') {
			steps {
				app.inside {
					sh 'echo "Tests passed"'
				}
			}
		}

		stage('Push image') {
			steps {
				docker.withRegistry('http://localhost:5000', 'local') {
					app.push("${env.BUILD_NUMBER}")
					app.push("latest")
				}
			}
		}
	}
}

