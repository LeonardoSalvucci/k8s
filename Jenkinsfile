pipeline {
    stage('Git Pull') {
        checkout scm
    }
}
pipeline {
    stage('Build Image') {
        docker.withRegistry('https://docker.io', 'd2fad48e-eb9a-405e-9e62-2cceaf1773b9') {
            def customImage = docker.build("lsalvucci/mypython:${env.BUILD_ID}")
            stage('Push Image') {
                customImage.push()
            }
        }
    }
}
pipeline {
    stage('Update Kubernetes') {
        agent {
            kubernetes {
                cloud 'kubernetes'
                containerTemplate {
                    name 'test-python'
                    image 'lsalvucci/mypython:${env.BUILD_ID}'
                    ttyEnabled true
                }
            }
        }
    }
}

