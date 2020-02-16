pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Build') {
            steps {
                echo "Building.. in ${env.WORKSPACE}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    // agent {
    //     docker {
    //         image 'node:6-alpine'
    //         args '-p 3000:3000 -p 5000:5000' 
    //     }
    // }
    // environment {
    //     CI = 'true'
    // }
    // stages {
    //     stage('Build') {
    //         steps {
    //             sh 'npm install'
    //         }
    //     }
    //     stage('Test') {
    //         steps {
    //             sh './jenkins/scripts/test.sh'
    //         }
    //     }
    // }
}
