ll
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
Obtained KubernetesPod.yaml from git git@github.com:YevhenVieskov/k6-dynamic-pods.git
[Pipeline] echo
[WARNING] label option is deprecated. To use a static pod template, use the 'inheritFrom' option.
[Pipeline] podTemplate
[Pipeline] {
[Pipeline] node
Created Pod: kubernetes jenkins/k6node-8szbq-2t8l1
Still waiting to schedule task
‘k6node-8szbq-2t8l1’ is offline
Unable to provision agent k6node-8szbq-2t8l1 :

- jnlp -- running
-----Logs-------------
INFO: Jenkins agent is running in headless mode.
Jan 18, 2022 6:43:19 AM hudson.remoting.Engine startEngine
INFO: Using Remoting version: 4.11
Jan 18, 2022 6:43:19 AM org.jenkinsci.remoting.engine.WorkDirManager initializeWorkDir
INFO: Using /home/jenkins/agent/remoting as a remoting work directory
Jan 18, 2022 6:43:19 AM org.jenkinsci.remoting.engine.WorkDirManager setupLogging
INFO: Both error and output logs will be printed to /home/jenkins/agent/remoting
Jan 18, 2022 6:43:19 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Locating server among [http://192.168.49.2:30000/]
Jan 18, 2022 6:43:21 AM org.jenkinsci.remoting.engine.JnlpAgentEndpointResolver resolve
INFO: Remoting server accepts the following protocols: [JNLP4-connect, Ping]
Jan 18, 2022 6:43:21 AM org.jenkinsci.remoting.engine.JnlpAgentEndpointResolver resolve
INFO: Remoting TCP connection tunneling is enabled. Skipping the TCP Agent Listener Port availability check
Jan 18, 2022 6:43:21 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Agent discovery successful
  Agent address: 192.168.49.2
  Agent port:    30010
  Identity:      92:a7:f7:56:72:66:e8:1f:93:c4:52:0d:e8:e6:31:ae
Jan 18, 2022 6:43:21 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Handshaking
Jan 18, 2022 6:43:21 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Connecting to 192.168.49.2:30010
Jan 18, 2022 6:43:21 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Trying protocol: JNLP4-connect
Jan 18, 2022 6:43:21 AM org.jenkinsci.remoting.protocol.impl.BIONetworkLayer$Reader run
INFO: Waiting for ProtocolStack to start.
Jan 18, 2022 6:43:22 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Remote identity confirmed: 92:a7:f7:56:72:66:e8:1f:93:c4:52:0d:e8:e6:31:ae
Jan 18, 2022 6:43:23 AM hudson.remoting.jnlp.Main$CuiListener status
INFO: Connected


- k6 -- terminated (0)
-----Logs-------------

Usage:
  k6 [command]

Available Commands:
  archive     Create an archive
  cloud       Run a test on the cloud
  convert     Convert a HAR file to a k6 script
  help        Help about any command
  inspect     Inspect a script or archive
  login       Authenticate with a service
  pause       Pause a running test
  resume      Resume a paused test
  run         Start a load test
  scale       Scale a running test
  stats       Show test metrics
  status      Show test status
  version     Show application version

Flags:
  -a, --address string      address for the api server (default "localhost:6565")
  -c, --config string       JSON config file (default "/root/.config/loadimpact/k6/config.json")
  -h, --help                help for k6
      --log-output string   change the output for k6 logs, possible values are stderr,stdout,none,loki[=host:port] (default "stderr")
      --logformat string    log output format
      --no-color            disable colored output
  -q, --quiet               disable progress updates
  -v, --verbose             enable verbose logging

Use "k6 [command] --help" for more information about a command.

Created Pod: kubernetes jenkins/k6node-8szbq-bdq3l
jenkins/k6node-8szbq-bdq3l Container k6 was terminated (Exit Code: 0, Reason: Completed)
Created Pod: kubernetes jenkins/k6node-8szbq-lxf8j

jenkins/k6node-8szbq-lxf8j Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-7glsl

jenkins/k6node-8szbq-7glsl Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-gprmm

jenkins/k6node-8szbq-gprmm Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-6xp7s

jenkins/k6node-8szbq-6xp7s Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-1rbc3

jenkins/k6node-8szbq-1rbc3 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-zpwln

jenkins/k6node-8szbq-zpwln Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-f8w58

jenkins/k6node-8szbq-f8w58 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-2btfp

jenkins/k6node-8szbq-2btfp Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-8sm0j

jenkins/k6node-8szbq-8sm0j Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-ksq8q

jenkins/k6node-8szbq-ksq8q Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-drv05

jenkins/k6node-8szbq-drv05 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-zn5nl

jenkins/k6node-8szbq-zn5nl Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-0bg4h

jenkins/k6node-8szbq-0bg4h Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-m09wf

jenkins/k6node-8szbq-m09wf Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-ph2l5

jenkins/k6node-8szbq-ph2l5 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-49rc9

jenkins/k6node-8szbq-49rc9 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-s55p8

jenkins/k6node-8szbq-s55p8 Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-fs0zg

jenkins/k6node-8szbq-fs0zg Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-64snn

jenkins/k6node-8szbq-64snn Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-qr4kf

jenkins/k6node-8szbq-qr4kf Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-r95kc

jenkins/k6node-8szbq-r95kc Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-rl30t

jenkins/k6node-8szbq-rl30t Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-jg4mn

jenkins/k6node-8szbq-jg4mn Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-5qqsw

jenkins/k6node-8szbq-5qqsw Container k6 was terminated (Exit Code: 0, Reason: Completed)

Created Pod: kubernetes jenkins/k6node-8szbq-4p84z
