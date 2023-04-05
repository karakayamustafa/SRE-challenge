#!/bin/bash

url = $1           # the url of endpoint which will be checked
threshold = $2     # the threshold value in seconds

# function to send an alert to slack
notifySlack() {
    curl -X POST -H 'Content-type: application/json' --data '{"text": "Load time for '$url' exceeds threshold"}'  https://hooks.slack.com/services/YOUR/TOKENIZED/URL
}

# store total time in loadTime variable
loadTime=$(curl -s -L -w %{time_total} -o /dev/null $url)
# use BC to comparison of two floating point numbers
if (( $(echo "$loadTime > $threshold" |bc -l) )); then
    notifySlack
else
    exit 0
fi