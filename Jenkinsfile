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
  agent {
    kubernetes {
      //label 'k6node'
      yamlFile 'KubernetesPod.yaml'
    }
  }
  stages {    

    stage("Checkout") {			 
      steps {
          git credentialsId: 'jenkins-kub-jenkins-monitor', url: 'https://github.com/YevhenVieskov/k6-dynamic-pods.git', branch: 'main' 
        }
	  } 

    stage('Performance Test') {
      steps {
        //script {
          def stages = [: ]
          echo "Pods count: ${params.POD_COUNT}"
          echo "VUs: ${params.VIRTUAL_USER}"
          echo "Duration: ${params.DURATION}"
          for (int i = 0; i < params.POD_COUNT.toInteger(); i++) {
            stages[i] = {
              //node('k6node') {
                stage("Stage-${i}") {
                  container('k6') {
                    //sh "wget --header='Authorization: token $GIT_TOKEN' --header='Accept: application/vnd.github.v3.raw' ${params.GIT_RAW_FILE} --output-document=pt.js"
                    //wget --http-user=USERNAME --http-password=PASSWORD http://SOMETURLTOFILE
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out influxdb=${params.INFLUX_DB}"
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out ${JENKINS_HOME}/results.json"
                    echo 'Running K6 performance tests...'
                    sh "k6 run --out json=${JENKINS_HOME}/results-${i}.json loadtests/performance-test.js "

                  }
                }
              }
            //node}
          }
          //parallel stages
        //script }
      }
    }

    stage('Convertation of Testing Results') {
      steps {
          k6JsonToJunitXml("${JENKINS_HOME}/results-0.json", "${JENKINS_HOME}/output-0.xml")
      }
      post {
				  always {							
					    junit(
                  allowEmptyResults: true,
                  testResults: "${JENKINS_HOME}/output.xml" //'**/test-reports/*.xml'
                  )
              }        
      }            
    }

  }
}
