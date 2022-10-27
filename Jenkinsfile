pipeline{
    agent any 
 tools { maven "Maven" }
 stages 
 {
  stage("build maven")
  {steps
   { 
   checkout([$class: 'GitSCM', brancgers: [[name: '*/main']], extensions: [], userRemoteConfig: [[url: 'https://github.com/nidhish-nanavati/myFirstRepository.git']]]) 
         }
  }
  
        stage("Build a new version of app on new commit")
     {
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.var'
                    sh 'jar -cvf swe-645.war -C src/main/webapp .'
                    sh 'echo ${env.BUILD_ID}'
                    def customImage = docker.build("nidhish98/studentsurvey645:${env.BUILD_ID}")
                    echo '${customImage}'
                }
            }
        }
        stage("Push image to docker hub"){
            steps{
                script{
                    sh 'docker push nidhish98/studentsurvey645:${env.BUILD_ID}'
                }
            }
        }
    }
}

