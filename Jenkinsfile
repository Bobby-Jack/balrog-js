pipeline{
    agent any
    stages{
        

        stage("Build"){
            steps{
                sh """
                    sed -i "s|api: '.*'|api: 'api.deployment.local.test.be'| " src/env/environement.ts
         """
                sh "docker build -t deployment-front ."
            }

        }
        
    }
   
}
