# Performance Test in Jenkins – Run Dynamic Pod Executors in Kubernetes Parallelly

Performance tests are a necessary and crucial part of all services in LINE, which ensures that software applications will perform well under the expected workload. Whenever features which may affect overall user experience are implemented, performance testing is executed as a part of the testing plan.

But setting up and maintaining a performance test environment is not always easy and efficient, reasons are listed as below:

* Server load criteria varies between features, component, and events

    * According to different performance criteria of features implemented on different components or sometimes event scales, the RPS (request per second) varies a lot. And most open source performance tools do not have features to control multiple test executors and help you to consolidate reports from each of them. Thus testers needs to perform steps manually and multiple try runs to find out the right scale machine to run the performance test scripts. These steps require allocating  new machines, installing necessary libraries, uploading scripts, and doing some try runs to make sure scripts can generate necessary workloads without over exhausting the test machine itself.

* Each service or team maintains its own performance test environment

    * Due to the reasons such as workload criteria and release schedule, each team or service here in Taiwan maintain their own set of performance test environments, which includes some workload machines, an Influx DB, and Grafana dashboard machines. These servers are quite identical in functionalities but the setting up and maintaining a set of these servers by each team is very cumbersome and not very good for the developer experience.

* Machine utilization is very low

    * Large scale performance tests like these are not required to be executed frequently and most of the time are considered when new features are implemented or there are changes to architecture. Each team having their own set of servers allocated for these infrequent workloads makes server utilization very low, but still it requires maintenance resources from time to time.

* Lack of a centralized monitoring dashboard

    * Performance tests require monitoring test executor resources and server sides resources all together at the same time. In the past, an engineer would open multiple terminal consoles in a desktop window and issues commands to monitor CPU, memory, disk, and network IO from there. These are not convenient to setup nor easy to preserve records from test executions.


So, in the following sections, we are going to show you how to leverage dynamic resource management from the Jenkins Kubernetes plugin to solve the problems highlighted above.

In LINE Taiwan, most of the time we use k6 as our load testing tool, so the setup below is based on this scenario, but should be the same for other tools as well.

## Architecture diagram

The idea here is to prepare a platform that uses the Kubernetes plugin for Jenkins which allows each team to run their performance (k6) test scripts without worrying about underlying infrastructure setup and maintenance.

The platform can evenly distribute workloads across all available nodes in the cluster to better simulate real-world scenarios without stressing computing resources and network bandwidth on a single machine. 

![Jenkins Kubernetes Dynamic Pods Architecture](./img/Dynamically-add-pod-to-run-performance-test-Copy-1-1024x643.png "San Juan Mountains")

For each team that wants to use the platform, the following attributes are provided as necessary:

1. POD_COUNT: How many Pods do you want to run your workload?
2. GIT_RAW_FILE: Your k6 performance script in raw format in your version control server
3. DURATION and VIRTUAL_USER: Check the definition of duration and VUs in the official k6 documentation
4. INFLUX_DB: The URL to your InfluxDB where load testing data is hosted (better to set up one server for all teams)

## Performance test platform resources

Git repository resources

To make this work, we need to prepare a Jenkins pipeline (jenkinsfile) and a PodTemplate to instruct Kubernetes plugin for Jenkins to provision the workload resources.


Verification

We can check this from k9s (Kubernetes management console) to see how workloads are provisioned, and we can see that Pods are evenly distributed across all available nodes as seen in the screenshot below.

You can verify each pod is running the k6 script by attaching into the shell of the k6 container and checking the standard output.

## Links

1. [Performance Test in Jenkins – Run Dynamic Pod Executors in Kubernetes Parallelly] (https://engineering.linecorp.com/en/blog/performance-test-in-jenkins-run-dynamic-pod-executors-in-kubernetes-parallelly/)

2. [k6 Prometheus Exporter] (https://github.com/benc-uk/k6-prometheus-exporter)
3. https://github.com/grafana/xk6-output-prometheus-remote


checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-token', url: 'https://github.com/YevhenVieskov/k6-dynamic-pods.git']]]
