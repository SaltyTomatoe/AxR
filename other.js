var request = require('request');
function updateClient(postData){
      var clientServerOptions = {
            uri: 'http://localhost:4000/obfuscate',
            body: JSON.stringify(postData),
            method: 'POST',
            headers: {
                  'Content-Type': 'application/json'
            }
      }
      request(clientServerOptions, function (error, response) {
          console.log(response.body);
          return;
      });
}

updateClient({
	toObfuscate : "print'hi'"
})