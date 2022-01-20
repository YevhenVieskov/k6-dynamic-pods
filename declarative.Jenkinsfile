@Library('k6jkmonitoring')_
properties([pipelineTriggers([githubPush()])])

pipeline {
  parameters {
    string(name: 'POD_COUNT', defaultValue: '2', description: 'number of Pods runs k6 scripts')
    string(name: 'GIT_RAW_FILE', defaultValue: 'https://raw.githubusercontent.com/loadimpact/k6/master/samples/http_get.js', description: 'raw file of the k6 performance script in git')
    string(name: 'DURATION', defaultValue: '5m', description: 'this will overwrite duration value in script')
    string(name: 'VIRTUAL_USER', defaultValue: '10', description: 'this will overwrite VUs value in script')
    //string(name: 'INFLUX_DB', defaultValue: 'http://your_influxDB_IP:_PORT/your_influxDB_name', description: 'change the influx URL or DB name as you wish')
  }
  environment {
    GIT_TOKEN = credentials('github-token')
  }
  
   /*agent {
        kubernetes {
            defaultContainer 'k6'
            yamlFile 'KubernetesPodPESidecar.yaml'                 
        }
    } */

    agent any

  stages {    

    stage("Checkout") {			 
        steps {
            git credentialsId: 'jenkins-kub-jenkins-monitor', url: 'https://github.com/YevhenVieskov/k6-dynamic-pods.git', branch: 'main' 
        }
	}

    


   stage('Perfomance Test'){
        parallel {
            stage("Branch 1") {
                agent {
                    kubernetes {
                        defaultContainer 'k6'
                        yamlFile 'KubernetesPodPESidecar.yaml'                 
                    }
                }

                steps {
                    container('k6') {
                        //sh "wget --header='Authorization: token $GIT_TOKEN' --header='Accept: application/vnd.github.v3.raw' ${params.GIT_RAW_FILE} --output-document=pt.js"
                    //wget --http-user=USERNAME --http-password=PASSWORD http://SOMETURLTOFILE
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out influxdb=${params.INFLUX_DB}"
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out ${JENKINS_HOME}/results.json"
                    
                    echo 'Running K6 performance tests...'
                    sh "k6 run ${params.GIT_RAW_FILE}  --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} "
                    sh "k6 run script.js "
                    sh "k6 run --out json=results.json script.js"

                    }
                }
            }

            stage("Branch 2") {
                agent {
                    kubernetes {
                        defaultContainer 'k6'
                        yamlFile 'KubernetesPodPESidecar.yaml'                 
                    }
                }

                steps {
                    container('k6') {                      
                    
                        echo 'Running K6 performance tests...'
                        sh "k6 run ${params.GIT_RAW_FILE}  --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} "
                        sh "k6 run script.js "
                        sh "k6 run --out json=results.json script.js"

                    }
                }
            }

        
        }
    }

    
    

    /*stage('Convertation of Testing Results') {
            steps {
                k6JsonToJunitXml("${env.JENKINS_HOME}/workspace/${env.JOB_NAME}/results.json", "${env.JENKINS_HOME}/workspace/${env.JOB_NAME}/output.xml")
            }
             post {
				always {							
					junit(
                        allowEmptyResults: true,
                        testResults: "${env.JENKINS_HOME}/workspace/${env.JOB_NAME}/output.xml" 
                    )
                }        
            }

            
        }*/

  }
}