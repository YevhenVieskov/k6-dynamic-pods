
Started by user unknown or anonymous
Obtained Jenkinsfile from git git@github.com:YevhenVieskov/k6-dynamic-pods.git
Loading library k6jkmonitoring@main
Attempting to resolve main from remote references...
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
using GIT_SSH to set credentials jenkins-kub-jenkins-monitor
 > git ls-remote -h -- git@github.com:YevhenVieskov/k6jkmonitoring.git # timeout=10
Found match: refs/heads/main revision 34ae0536481cd48da6d252fdf2535c3ddbc1a5c7
The recommended git tool is: NONE
using credential jenkins-kub-jenkins-monitor
 > git rev-parse --resolve-git-dir /var/jenkins_home/workspace/dynamic-pods@libs/k6jkmonitoring/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:YevhenVieskov/k6jkmonitoring.git # timeout=10
Fetching without tags
Fetching upstream changes from git@github.com:YevhenVieskov/k6jkmonitoring.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
using GIT_SSH to set credentials jenkins-kub-jenkins-monitor
 > git fetch --no-tags --force --progress -- git@github.com:YevhenVieskov/k6jkmonitoring.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Checking out Revision 34ae0536481cd48da6d252fdf2535c3ddbc1a5c7 (main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 34ae0536481cd48da6d252fdf2535c3ddbc1a5c7 # timeout=10
Commit message: "jenkins shared lib rary is added"
 > git rev-list --no-walk 34ae0536481cd48da6d252fdf2535c3ddbc1a5c7 # timeout=10
[Pipeline] Start of Pipeline
[Pipeline] properties
[Pipeline] readTrusted
Obtained KubernetesPod2.yaml from git git@github.com:YevhenVieskov/k6-dynamic-pods.git
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: kubernetes jenkins/k6node-2g2z3-z4sfz
Agent k6node-2g2z3-z4sfz is provisioned from template k6node-2g2z3
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    buildUrl: "http://192.168.49.2:30000/job/dynamic-pods/39/"
    runUrl: "job/dynamic-pods/39/"
  labels:
    app: "k6"
    jenkins: "slave"
    jenkins/label-digest: "d1d4c30cf0db0fedc2eb0393e124c5c795f8cdbc"
    jenkins/label: "k6node"
  name: "k6node-2g2z3-z4sfz"
spec:
  affinity:
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: "app"
              operator: "In"
              values:
              - "k6"
              - "k6node"
          topologyKey: "kubernetes.io/hostname"
          namespace: "jenkins"
        weight: 100
  containers:
  - args:
    - "run"
    - "https://raw.githubusercontent.com/benc-uk/k6-prometheus-exporter/main/load-tests/generic.js"
    - "--address"
    - "0.0.0.0:6565"
    env:
    - name: "TARGET_URL"
      value: "https://benc.dev/minis/descent-done/i1.png"
    - name: "RAMP_TIME"
      value: "5m"
    - name: "RUN_TIME"
      value: "10m"
    - name: "USER_COUNT"
      value: "50"
    image: "loadimpact/k6"
    name: "k6"
    resources:
      requests:
        cpu: "100m"
        memory: "256Mi"
    securityContext:
      runAsUser: 0
    tty: true
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  - env:
    - name: "JENKINS_SECRET"
      value: "********"
    - name: "JENKINS_TUNNEL"
      value: "192.168.49.2:30010"
    - name: "JENKINS_AGENT_NAME"
      value: "k6node-2g2z3-z4sfz"
    - name: "JENKINS_NAME"
      value: "k6node-2g2z3-z4sfz"
    - name: "JENKINS_AGENT_WORKDIR"
      value: "/home/jenkins/agent"
    - name: "JENKINS_URL"
      value: "http://192.168.49.2:30000/"
    image: "jenkins/inbound-agent:4.11-1-jdk11"
    name: "jnlp"
    resources:
      limits: {}
      requests:
        memory: "256Mi"
        cpu: "100m"
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
  nodeSelector:
    kubernetes.io/os: "linux"
  restartPolicy: "Never"
  volumes:
  - emptyDir:
      medium: ""
    name: "workspace-volume"
  namespace: "jenkins"

Running on k6node-2g2z3-z4sfz in /home/jenkins/agent/workspace/dynamic-pods
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential jenkins-kub-jenkins-monitor
Cloning the remote Git repository
Cloning repository git@github.com:YevhenVieskov/k6-dynamic-pods.git
 > git init /home/jenkins/agent/workspace/dynamic-pods # timeout=10
Fetching upstream changes from git@github.com:YevhenVieskov/k6-dynamic-pods.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
using GIT_SSH to set credentials jenkins-kub-jenkins-monitor
 > git fetch --tags --force --progress -- git@github.com:YevhenVieskov/k6-dynamic-pods.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
Checking out Revision 27da80d7ceb1f3f77e5513e0015e59b6027f3518 (refs/remotes/origin/main)
 > git config remote.origin.url git@github.com:YevhenVieskov/k6-dynamic-pods.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 27da80d7ceb1f3f77e5513e0015e59b6027f3518 # timeout=10
Commit message: "pod2 template is enabled"
 > git rev-list --no-walk dc29840b7f2de96881d1ad716a7ea77f640def73 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withCredentials
Masking supported pattern matches of $GIT_TOKEN or $GIT_TOKEN_PSW
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] git
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential jenkins-kub-jenkins-monitor
Fetching changes from the remote Git repository
 > git rev-parse --resolve-git-dir /home/jenkins/agent/workspace/dynamic-pods/.git # timeout=10
 > git config remote.origin.url https://github.com/YevhenVieskov/k6-dynamic-pods.git # timeout=10
Fetching upstream changes from https://github.com/YevhenVieskov/k6-dynamic-pods.git
 > git --version # timeout=10
 > git --version # 'git version 2.30.2'
using GIT_SSH to set credentials jenkins-kub-jenkins-monitor
 > git fetch --tags --force --progress -- https://github.com/YevhenVieskov/k6-dynamic-pods.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Checking out Revision 27da80d7ceb1f3f77e5513e0015e59b6027f3518 (refs/remotes/origin/main)
Commit message: "pod2 template is enabled"
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 27da80d7ceb1f3f77e5513e0015e59b6027f3518 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b main 27da80d7ceb1f3f77e5513e0015e59b6027f3518 # timeout=10
 > git rev-list --no-walk dc29840b7f2de96881d1ad716a7ea77f640def73 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Performance Test)
[Pipeline] script
[Pipeline] {
[Pipeline] echo
Pods count: 2
[Pipeline] echo
VUs: 10
[Pipeline] echo
Duration: 5m
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // podTemplate
[Pipeline] End of Pipeline
Finished: SUCCESS