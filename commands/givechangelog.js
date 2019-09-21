const discord = require("discord.js")
const index = require("../index")
module.exports.run = async(bot,message,args)=>{
	let toSend = new discord.RichEmbed()
	let togive = message.member
	var role = message.guild.roles.find(role => role.name === "changelogs");
	if(togive.roles.has(role.id)){
		togive.removeRole(role,"givechangelog cmd")
		toSend.setAuthor("Changelogs Role")
		toSend.setColor(index.embeds.color)
		toSend.setTimestamp()
		toSend.addField(`Success!`,`You will no longer be notified for any future changelogs :(`)
	}else{
		togive.addRole(role,"givechangelog cmd")
		toSend.setAuthor("Changelogs Role")
		toSend.setColor(index.embeds.color)
		toSend.setTimestamp()
		toSend.addField(`Success!`,`You have been assigned the changelogs role! You will be notified for any future updates in #changelogs`)
	}
      message.channel.send(toSend);
}

module.exports.help = {
    name:"gchangelog",
    args:"N/A"
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