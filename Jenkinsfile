node {
	def app
    
	stage('Git Pull') {
        checkout scm
    }

	stage('Build image') {
		app = docker.build("localhost:5000/mypython")
	}

	stage('Test image') {
		app.inside {
			sh 'echo "Tests passed"'
		}
	}

	stage('Push image') {
		docker.withRegistry('http://localhost:5000', 'local') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
	}
}

