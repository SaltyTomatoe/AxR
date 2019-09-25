const discord = require("discord.js")
const index = require("../index")
module.exports.run = async(bot,message,args)=>{
    let os = require("../obfuscation_stats.json")
    let type = args[0]
    if(!type)return message.channel.send("Err: Please input the help category you need")
    type = type.toLowerCase().substr(0,3)
    if(!check(type,["obf"])===true)return message.channel.send("Err: Not a valid type. Valid type(s) are `obfuscation`.");
    if(type==="obf"){
        let toSend = new discord.RichEmbed()
        .setAuthor("Obfuscation Help")
        .setColor(index.embeds.color)
        .setTimestamp()
        .addField(`How To Obfuscate`,`Go to the bot's dm, send your .lua or .txt file with the comment ${index.info.prefix}obfuscate`)
        .addField(`Arguments`,`Currently NONE. Due to the new bytecode format, bytecode compression doesn't exist. Custom Variables still not in affect, sorry`)
        .addField(`Additional Info`,`Your custom variable cannot contain these characters:\n**~ ! @ # $ % ^ & * ( ) + } { | " : < > ? }** as well as any spaces.`)
        message.channel.send(toSend);
    }
}

module.exports.help = {
    name:"help",
    args:"category"
}

function check(stuff,arr){
    let ret = false
    arr.forEach(stupid => {
        if(stupid === stuff){
            ret = true
        }
    })
    return ret
}