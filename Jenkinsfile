pipeline{
    agent{
        label "node"
    }
    stages{
        

        stage("Build"){
            steps{
                sed -i "s|api: '.*'|api: 'api.deployment.local.test.be'| src/env/environment.ts"
                sh "docker build -t deployment-front ."
            }

        }
        
    }
   
}
