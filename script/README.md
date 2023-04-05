## README

The script can be used by providing the URL which will be checked and the desired threshold for load time. It can be used as many as needed by configuring crontab line below:

```bash
* * * * *       /scripts/load-check.sh example.com 2
*/2 * * * *     /scripts/load-check.sh https://www.example.com/main.php 1
```


- It is possible to use Prometheus PushGateway and writing custom Prometheus exporter. Also, we can append the load times a file and use [Grok exporter](https://www.colamda.de/blog/2019-08-26-Building-A-Simple-Prometheus-Exporter/) afterwards. Therefore, we can set the threshold on Prometheus side and configure an alert rule.

- There is also solutions like [Gatus](https://gatus.io/) to check load time externally.