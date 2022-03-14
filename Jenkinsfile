//@Library('k6jkmonitoring')_
properties([pipelineTriggers([githubPush()])])

pipeline {
  parameters {
    string(name: 'POD_COUNT', defaultValue: '2', description: 'number of Pods runs k6 scripts')
    string(name: 'GIT_RAW_FILE', defaultValue: 'https://raw.githubusercontent.com/loadimpact/k6/master/samples/http_get.js', description: 'raw file of the k6 performance script in git')
    string(name: 'DURATION', defaultValue: '5m', description: 'this will overwrite duration value in script')
    string(name: 'VIRTUAL_USER', defaultValue: '10', description: 'this will overwrite VUs value in script')
    string(name: 'INFLUX_DB', defaultValue: 'http://192.168.49.2:31234/k6-monitoring', description: 'change the influx URL or DB name as you wish')
    string(name: 'INFLUXDB_ORGANIZATION', defaultValue: 'vieskov', description: 'change the influx organisation name as you wish')
    string(name: 'INFLUXDB_BUCKET', defaultValue: 'k6-monitoring', description: 'change the influx bucket name as you wish')
    string(name: 'INFLUXDB_TOKEN', defaultValue: 'LlLkXktPwNGYp_Qyoq3zaabF4Wtg3uFjasZy7FtE7Y0RtxpYt3ump4s90woLbkP-LvDGc8Ml8HV-NfQEXPPcXA==', description: 'change the influx token as you wish')
  }
  
  agent {
    kubernetes {
      label 'k6node'
      //yamlFile 'KubernetesPod.yaml'
      yamlFile 'KubernetesPodPESidecar.yaml'
      defaultContainer 'k6' 
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
        script {
          def stages = [:]
          echo "Pods count: ${params.POD_COUNT}"
          echo "VUs: ${params.VIRTUAL_USER}"
          echo "Duration: ${params.DURATION}"
          for (int i = 0; i < params.POD_COUNT.toInteger(); i++) {
            echo"I am in cycle"
            stages[i] = {
              node('k6node') {
                stage("Stage-${i}") {
                  
                  container('k6') {
                    //sh "wget --header='Authorization: token $GIT_TOKEN' --header='Accept: application/vnd.github.v3.raw' ${params.GIT_RAW_FILE} --output-document=pt.js"
                    //wget --http-user=USERNAME --http-password=PASSWORD http://SOMETURLTOFILE
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out influxdb=${params.INFLUX_DB}"
                    //sh "k6 run pt.js --duration ${params.DURATION} --vus ${params.VIRTUAL_USER} --out ${JENKINS_HOME}/results.json"
                      
                        echo 'Running K6 performance tests...'
                        sh "K6_INFLUXDB_ORGANIZATION=${params.INFLUXDB_ORGANIZATION}  K6_INFLUXDB_BUCKET=${params.INFLUXDB_BUCKET} K6_INFLUXDB_TOKEN=${params.INFLUXDB_TOKEN}   k6 run -o xk6-influxdb=${params.INFLUX_DB} ${params.GIT_RAW_FILE} --duration ${params.DURATION} --vus ${params.VIRTUAL_USER}  "    
                        //sh "k6 run ${params.GIT_RAW_FILE}  --duration ${params.DURATION} --vus ${params.VIRTUAL_USER}  --out influxdb=${params.INFLUX_DB}"
                        //sh "k6 run script.js "
                    
                     


                  }
                }
              }
            }
          }
          parallel stages
         }
      }
    }

    

  }
}
