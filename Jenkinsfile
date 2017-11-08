node {
    checkout scm
    docker.withRegistry('https://docker.io', 'd2fad48e-eb9a-405e-9e62-2cceaf1773b9') {
        def customImage = docker.build("lsalvucci/mypython:${env.BUILD_ID}")
        customImage.push()
    }
}
