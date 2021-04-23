pipeline { 
    environment { 
        serverRegistry = "moaazzaki/jdc-server"
        clientRegistry = "moaazzaki/jdc-client"
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
        stage('Building our image') { 
            steps { 
                script { 
                    serverImage = docker.build serverRegistry
                    clientImage = docker.build clientRegistry
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        serverImage.push() 
                        clientImage.push() 
                    }
                } 
            }
        } 
    }
}

