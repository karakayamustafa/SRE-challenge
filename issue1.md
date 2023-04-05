## Issue 1

In case of a surge in traffic; 
1. I would try to fix the load problem on the HAProxy pods first. After looking at metrics, the issue would be possibly related to resource bottleneck. I would either edit cpu/mem request and limits, or scale-up the number of replicas to mitigate the load. 

2. After everything is back to normal, I would investigate the root cause of high traffic. It may be legitimate and may be related about newly joined customer or a customer gets peak traffic because of an event announced(discount, campaing etc.). On the other hand, the reason may be a DDoS attack. 

- It is hard to identify a DDoS attack; however, some common patterns can be checked:
    - a distinct amount of traffic comes from a single IP address or IP range
    - a single behavioral profile, such as device type, geolocation, or web browser version
    - a traffic originated from unusual geolocation
    - requests to commonly used endpoints that not exist on our system

- To identify these patterns, the external load-balancer must be configured to pass the headers which includes these information before the attack. If so,
    - I would examine metrics on Grafana and Prometheus. However, the metrics would not be enough to find these patterns.
    - I would examine the logs of HAProxy nodes. It is possible to find valuable information from logs.
    - It is important to aggregate the logs and visualize them by using solutions like Elasticsearch and Kibana.

- If I could determine that the reason is a DDoS attack; rate-limiting can be configured on HAProxy configuration. Also, blocking that kind of traffic is possible before the traffic reaches to the ingress. The external load balancers can be configured. The best practice use security products(appliances, applications, services like Cloudflare/Akamai).

3. If the traffic is legitimate, 

- An alert can be configured using Prometheus rules and Alertmanager to be informed if the traffic load increases again. The threshold can be configured accordingly to take action before a problem occurs.

- According to HAProxy documentation, it is possible to use [Horizontal Pod Autoscaler(HPA)](https://github.com/haproxytech/helm-charts/tree/main/kubernetes-ingress#installing-with-horizontal-pod-autoscaler-hpa) and [Kubernetes Event-driven Autoscaling (KEDA)](https://github.com/haproxytech/helm-charts/tree/main/kubernetes-ingress#installing-with-kubernetes-event-driven-autoscaling-keda) with HAProxy.

- It is also a good idea to install the [ServiceMonitor](https://github.com/haproxytech/helm-charts/tree/main/kubernetes-ingress#installing-the-servicemonitor) if it is not already enabled.