const discord = require("discord.js")
const users = require('../users')
const index = require('../index')
const data = require("../obfuscation_stats.json")
const cEmbed = new discord.RichEmbed()
cEmbed.setAuthor("Skiddy Bot")
cEmbed.setColor(index.embeds.color)
cEmbed.addField(`${data["OBF_STATS"]["version"]}`,`Started the revamp of Axon! Custom Variables aren't here rn sorry!`)
cEmbed.addField(`Additional Notes`,`N/A`)
cEmbed.addField(`TODO:`,`1:Better anti decompile\n2:Possible anti memory dump? and obvs custom variables`)

module.exports.run = async(bot,message,args)=>{
    cEmbed.setTimestamp()
    cEmbed.setFooter("Changelog")
    message.channel.send(cEmbed)
}

module.exports.help={
    name:"changelog"
}