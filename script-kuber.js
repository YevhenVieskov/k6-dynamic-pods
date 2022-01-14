//https://golangrepo.com/repo/k6io-xk6-kubernetes

import { Kubernetes } from 'k6/x/kubernetes';

export default function () {
  kubernetes = new Kubernetes()
  console.log(`${kubernetes.pods.list()} Pods found:`)
}

