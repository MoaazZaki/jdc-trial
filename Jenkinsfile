pipeline { 
    environment { 
        user = ' '
        pass = ' '
        serverImage = 'jdc-server' 
        clientImage = 'jdc-client'
        registryCredential = 'docker-jenkins' 
        version = ":1.0"
    }
    agent any 
    stages { 
        stage('Cloning our Git') { 
            steps { 
                git 'https://github.com/MoaazZaki/jdc-trial.git' 
            }
        } 
        stage('Logging to dockerhub account') { 
            steps { 
                script { 
                    sh 'docker login -u ' + user + ' -p ' + pass
                }
            } 
        }
        stage('Building our image') { 
            steps { 
                script { 
                    sh 'docker-compose build --pull'
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    sh 'docker-compose push'
                } 
            }
        } 
    }
}

