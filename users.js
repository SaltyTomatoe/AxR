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