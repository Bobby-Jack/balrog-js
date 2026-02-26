pipeline{
    agent any
    stages{
        

        stage("Build"){
            steps{
                sh """
                    sed -i "s|api: '.*'|api: 'api.deployment.local.test.be'| " src/env/environment.ts
         """
                sh "docker build -t deployment-front ."
            }

        }
        
    }
   
}
