const discord = require("discord.js")
const users = require('../users')
String.prototype.defs = function(key, n = 126) {
	// return String itself if the given parameters are invalid
	if (!(typeof(key) === 'number' && key % 1 === 0)
	  || !(typeof(key) === 'number' && key % 1 === 0)) {
	  return this.toString();
	}
    
	return this.toString().obfs(n - key);
};
module.exports.run = async(bot,message,args)=>{
    if(message.author.id===232569501080748032 || 487015678050566154 || 487015678050566154){
	  try{//mgoeaa5rzvgpahnb82keq1lg6is9yxgnmrzxfsOCNzgYUys1vhrp8tZOwfWaC1w78+d+EjygitpTs= "key:" + key + iv + userId + " "
	  //iv = eaa5rzvgpahnb82k
        let encrypted = args[0]
        let key = encrypted.substr(3,16)
	  let toRet = key.defs(16)
        return message.channel.send(`Decrypted! User id is:${toRet} `)
        }catch(e){
            message.channel.send(`${e}`)
        }
    }else{
        console.log('fail')
        return
    }
}

module.exports.help={
    name:"decrypt"
}