var crypto = require('crypto')


var iv = randomstring(16);
var key = randomstring(16);

module.exports.encrypt =(text,iv,key) =>{
    var cipher = crypto.createCipheriv('aes-128-cbc', new Buffer(key), new Buffer(iv));
    var crypted = cipher.update(text,'utf-8','base64')
    crypted += cipher.final('base64');
    return crypted;
}
module.exports.decrypt =(text,iv,key)=>{
    var decipher = crypto.createDecipheriv('aes-128-cbc', new Buffer(key), new Buffer(iv));
    var dec = decipher.update(text,'base64','utf-8')
    dec += decipher.final('utf-8');
    return dec;
}

function randomstring(length){
    var complete = ""
    var times = 0
    length = length/8
    while(times < length){
        times = times+1
        complete = complete+Math.random().toString(36).slice(-8);
    }
    return complete
}
function rot13(s) {
    return s.replace(/[A-Za-z]/g, function (c) {
      return "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm".charAt(
             "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".indexOf(c)
      );
    } );
  }

String.prototype.obfs = function(key, n = 126) {
	// return String itself if the given parameters are invalid
	if (!(typeof(key) === 'number' && key % 1 === 0)
	  || !(typeof(key) === 'number' && key % 1 === 0)) {
	  return this.toString();
	}
    
	var chars = this.toString().split('');
    
	for (var i = 0; i < chars.length; i++) {
	  var c = chars[i].charCodeAt(0);
    
	  if (c <= n) {
	    chars[i] = String.fromCharCode((chars[i].charCodeAt(0) + key) % n);
	  }
	}
    
	return chars.join('');
};
    
    /**
     * De-obfuscate an obfuscated string with the method above.
     * @param  {[type]} key rotation index between 0 and n
     * @param  {Number} n   same number that was used for obfuscation
     * @return {[type]}     plaintext string
     */
String.prototype.defs = function(key, n = 126) {
	// return String itself if the given parameters are invalid
	if (!(typeof(key) === 'number' && key % 1 === 0)
	  || !(typeof(key) === 'number' && key % 1 === 0)) {
	  return this.toString();
	}
    
	return this.toString().obfs(n - key);
};