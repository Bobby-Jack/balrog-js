pipeline{
    agent any
    environment {
        SSH_SERVER = credentials('ssh-server')
        SSH_KEY_CREDENTIALS_ID = 'prod-server-key'
        DEPLOY_PATH = credentials('deployment-prod')
    }
    stages{
        

        stage("Build"){
            steps{
                sh """
                    sed -i "s|api: '.*'|api: 'api.deployment.local.test.be'| " src/env/environement.ts
         """
                sh 'docker image rm -f deployment-front || true'
                sh "docker build -t deployment-front ."
                sh 'docker save deployment-front -o ./deployment-front.tar'
            }

        }

        stage("Deploy"){
            steps{
                sshagent([env.SSH_KEY_CREDENTIALS_ID]) {
                    sh '''
                        scp ./deployment-front.tar $SSH_SERVER:$DEPLOY_PATH/
                        ssh $SSH_SERVER "
                            cd $DEPLOY_PATH
                            docker load -i deployment-front.tar
                            docker compose stop back || true
                            docker compose rm back || true
                            docker compose up back -d
                        "
                    '''
                }
            }
        }
        
    }
   
}
