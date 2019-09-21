const discord = require("discord.js")
const index = require("../index")
module.exports.run = async(bot,message,args)=>{
    let os = require("../obfuscation_stats.json")
    let type = args[0]
    if(!type)return message.channel.send("Err: Please input the stat type you want")
    type = type.toLowerCase().substr(0,3)
    if(!check(type,["obf","ser","use"])===true)return message.channel.send("Err: Not a valid type. Valid types are `obfuscation`,`server`,`user`.");
    if(type==="obf"){
        let info = os["OBF_STATS"]
        let toSend = new discord.RichEmbed()
        .setAuthor("Obfuscation Stats")
        .setColor(index.embeds.color)
        .setTimestamp()
        .addField(`Obfuscation Count:`,`${info["times"]}`)
        .addField(`Obfuscator Version: `,`${info["version"]}`)
        message.channel.send(toSend);
    }else if(type==="ser"){
        message.channel.send("Not finished.")
    }else if(type==="use"){
        let usr = os["USER_STATS"]
        let myStats = usr[message.author.id]

        if(!myStats)return message.channel.send("Err: No stats found for `"+message.author.username+"#"+message.author.discriminator+"`")

        let toSend = new discord.RichEmbed()
        .setAuthor("Obfuscation Stats")
        .setColor(index.embeds.color)
        .setTimestamp()
        .addField(`Obfuscation Count:`,`${myStats["times"]}`)
        message.channel.send(toSend);
    }
}

module.exports.help = {
    name:"stats",
    args:"type"
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