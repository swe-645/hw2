pipeline{
    agent any 
 tools { maven "Maven" }
 stages 
 {
  stage("build maven")
  {steps
   { 
   checkout([$class: 'GitSCM', brancgers: [[name: '*/main']], extensions: [], userRemoteConfig: [[url: 'https://github.com/swe-645/hw2.git']]]) 
         }
  }
  
        stage("Build a new version of app on new commit")
     {
            steps{
                script{
                    checkout scm
                    sh 'rm -rf *.var'
                    sh 'jar -cvf swe-hw2.war -C src/main/webapp .'
                    sh 'echo ${env.BUILD_ID}'
                    
                }
            }
        }
    }
}

