const discord = require("discord.js")
const users = require('../users')
module.exports.run = async(bot,message,args)=>{
    console.log("RAN")
    console.log(message.author.id)
    if(message.author.id===232569501080748032 || 487015678050566154){
        try{
        let encrypted = args[0]
        let enc1 = encrypted.split("(")
        let enc2 = enc1[1].split(")")
        let iv = enc1[0]
        let key = enc2[1]
        let userid = enc2[0]
        let toRet = users.decrypt(userid,iv,key)
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