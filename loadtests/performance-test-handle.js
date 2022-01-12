import { sleep } from"k6";
import http from "k6/http";
import { jUnit, textSummary } from 'https://jslib.k6.io/k6-summary/0.0.1/index.js';

export let options = {
  duration: "1m",
  vus: 50,
  thresholds: {
    http_req_duration: ["p(95)<500"] // 95 percent of response times must be below 500ms
  }
};

export default function() {
  http.get("http://test.k6.io/contacts.php");
  sleep(3);
};

export function handleSummary(data) {

  console.log('Preparing the end-of-test summary...');


  // Send the results to some remote server or trigger a hook

  const resp = http.post('https://httpbin.test.k6.io/anything', JSON.stringify(data));

  if (resp.status != 200) {

    console.error('Could not send summary, got status ' + resp.status);

  }


  return {

    'stdout': textSummary(data, { indent: ' ', enableColors: true }), // Show the text summary to stdout...

    'junit_handle.xml': jUnit(data), // but also transform it and save it as a JUnit XML...

    'summary_handle.json': JSON.stringify(data), // and a JSON with all the details...

    // And any other JS transformation of the data you can think of,

    // you can write your own JS helpers to transform the summary data however you like!

  };

}