pipeline {
    environment {
        registry = "bhargavi645/hw2"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    
    stages {
        stage('Cloning Git') {
            steps{
                git 'https://github.com/swe-645/hw2.git'
                withAnt(installation: 'Ant 1.10.7') {
                        sh'''
                        #!/bin/bash
                        cd ~/workspace/swe-645/hw2
                        ls
                        ant war
                        '''
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
                script {

                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }

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

        stage('Deploy Image') {
            steps{
                script{
                    docker.withRegistry('',registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }
		
		stage('redeploy') {
            steps{
               
               sh'''
               #!/bin/bash
                docker login
                docker pull bhargavi645/hw2:$BUILD_NUMBER
                sudo -s source /etc/environment
                kubectl --kubeconfig /home/ubuntu/.kube/config set image deployment swe-645 hw2=docker.io/bhargavi645/hw2:$BUILD_NUMBER
            '''
            }
        }

        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registryRestful:$BUILD_NUMBER"
            sh "docker rmi $registryApp:$BUILD_NUMBER"
          }
        }
		
    }

     
}

