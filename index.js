const child = require('child_process').exec;
const fs = require('fs');
var bodyParser = require('body-parser')
var multer = require('multer') // v1.0.5
var upload = multer() // for parsing multipart/form-data
const discord = require("discord.js")
const bot = new discord.Client()
const http = require('https')
const express = require('express');
const app = express();
const main = require("./users")
bot.commands = new discord.Collection();
let success = new discord.RichEmbed()
success.setAuthor("AXR")
success.setColor("#c1b0e8")
success.setTitle("Obfuscator")
success.setFooter("This message will auto delete in 30 seconds for security reasons")
/////CONFIG
var prefix = ";"
var port = 80
var canObfuscate = true
//DONE
function msleep(n) {
    Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, n);
  }
  function sleep(n) {
    msleep(n*1000);
  }
bot.on("ready", async () => {
    //bot.user.setActivity("Call of Duty Blackout");
    bot.user.setActivity("with new obfuscation stuff", {type: "PLAYING"});
    /*var guildList = bot.guilds.array()
    try{
        console.log("Configured Maps")
        guildList.forEach(guild => {
            var guildmap = module.exports.map.mainMap.get(guild.id);
            if (!guildmap) {
                module.exports.map.mainMap.set(guild.id, basicConstructor);
                guildmap = module.exports.map.mainMap.get(guild.id)
            }
            var delTable = guildmap.settings.find(stuff => stuff.name === "Deleted")
            if(delTable.delChannel===undefined){
                guild.channels.forEach(channel => {
                    if(channel.name.toLowerCase()==="deleted"){
                        var settings = guildmap.settings
                        var pos = settings.indexOf(delTable)
                        settings.splice(pos,1)
                        settings.push({name:"Deleted",deletedChannelFound:true,delChannel:channel.id})
                    }
                });
            }
        })
    }catch(e){
        console.log(e.stack)
    }*/
    console.log("Finished setup proccesses.")
});

/*child(executablePath, ["Nerd.lua|done.lua"], function(err, data) {
    if(err){console.log(err)};
    let thingy = data.toString()
    var arr = thingy.split("|");
    console.log(thingy)
    console.log("hey")
});*/
fs.readdir("./commands/", (err, files) =>{
    if(err) console.log(err);
    let jsfile = files.filter(f => f.split(".").pop() === "js")
    if(jsfile.length <= 0 ){
        console.log("Failed to find commands.");
        return;
    }
    jsfile.forEach((f, i) =>{
        let props = require(`./commands/${f}`);
        bot.commands.set(props.help.name, props);
        /*if(!props.help.settings.not_shown&&!props.help.settings.not_shown===true){
            if(props.help.settings.type==="moderation"){
                cmds_mod.addField(props.help.name,props.help.description)
            }else if(props.help.settings.type==="fun"){
                cmds_fun.addField(props.help.name,props.help.description)
            }else if(props.help.settings.type==="info"){
                cmds_info.addField(props.help.name,props.help.description)
            }
        }*/
    });
});
var isObfuscating = false
bot.on("message",async message => {
    if(message.author.bot) return;
    if(message.attachments.size>0&&message.channel.type=="dm"){
        let first = message.attachments.first()
        messageArray = first.message.content.split(" ");
        cmd = messageArray[0];
        args = messageArray.slice(1);
		if(cmd===";obfuscate" && isObfuscating == false && canObfuscate == true){
			if(message.attachments.first()){
			let extension = getFileExtension(message.attachments.first().filename)
			if(extension == "lua"){
				message.channel.send("Recieved File! Starting Obfuscation...")
			}                     
			else if(extension == "txt"){
				message.channel.send("Recieved File! Starting Obfuscation...")
			}
			else
				return message.channel.send("Please only send .txt or .lua files, I do not accept any other file. Filetype:"+extension)
			}
			let nameOfText = randomstring(20)
			let nameOfFinal = "AXR_out.lua"//randomstring(20)
			let retr = await downloadAttachment(first.url,"AXR_in.lua")
			let key = randomstring(16)
			let iv = randomstring(16)
			let userId = message.author.id
			userId = main.encrypt(userId,iv,key)
			var parameters = " ";
			if(args.includes("compress")){
				parameters = parameters + "compress "
				//console.log("Compress enabled!")
			}
			try{
				child("java -jar "+__dirname+"/ObfuscatorOUTPUT.jar " + parameters, function(err, data) {
					let thingy = data.toString()
					var arr = thingy.split("|");
					console.log(thingy)
					try{
						child("lua " + __dirname + "/mainHelpers/minify.lua", parameters, function(err, dataa) {
							let success = new discord.RichEmbed()
							success.setAuthor("AXR")
							success.setColor("#c1b0e8")
							success.setTitle("Obfuscator")
							success.setFooter("This message will auto delete in 30 seconds for security reasons")
							success.setTimestamp()
							success.addField(":moneybag: Finished Obfuscating :moneybag:",`:ok_hand:`)
							let data = require("./obfuscation_stats.json")
							if(!data["USER_STATS"][message.author.id]){
							data["USER_STATS"][message.author.id]={
								"times":0
							}
							}
							data["USER_STATS"][message.author.id]={
							"times":data["USER_STATS"][message.author.id].times+1
							}
							data["OBF_STATS"].times = data["OBF_STATS"].times + 1
							fs.writeFile("./obfuscation_stats.json",JSON.stringify(data),(err)=>{
							if(err)console.log(err)
							})
							message.channel.send(success).then(msg => {
								msg.delete(30000)
							})
							.catch(err => console.log(err));
							message.channel.send("", { files: [`./${nameOfFinal}`] }).then(msg => {
								msg.delete(30000)
							})
							.catch(err => console.log(err));
						});
						isObfuscating = false
						}catch(e){
						console.log(e)
						isObfuscating = false
					}
				});
				isObfuscating = false
			}catch(e){
				isObfuscating = false
				console.log(e)
			}
        	}else if(cmd==";obfuscate" && canObfuscate==true){
			message.channel.send("Please wait while another script is being obfuscated!")
		}else if(canObfuscate == false){
			message.channel.send("Sorry, obfuscation is currently disabled")
		}
    }else{
        let messageArray = message.content.split(" ");
        let cmd = messageArray[0]
        let args = messageArray.slice(1);
        if(cmd===";decrypt"&&message.channel.type=="dm"){
            messageArray = message.content.split(" ");
            cmd = messageArray[0];
            args = messageArray.slice(1);
            let commandFile = bot.commands.get("decrypt")
            if(commandFile){
                commandFile.run(bot,message,args)
            }
        }else{
            let commandFile = bot.commands.get(cmd.substr(prefix.length))
            if(commandFile){
                commandFile.run(bot,message,args)
            }
        }
    }
})
console.log("Logging in...")
bot.login("NTg1OTMwNjYyMTIxNTcwMzA4.XPgoeQ.rJzr94_ktEcuBNjsEdDBnr3-G0Y")
module.exports.info = {
    directory:__dirname
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

function downloadAttachment(url, dest) {
    return new Promise((resolve, reject) => {
        http.get(url, (res) => {
            if (res.statusCode !== 200) {
                var err = new Error('File couldn\'t be retrieved');
                err.status = res.statusCode;
                return reject(err);
            }
            var chunks = [];
            res.setEncoding('binary');
            res.on('data', (chunk) => {
                chunks += chunk;
            }).on('end', () => {
                var stream = fs.createWriteStream(dest);
                stream.write(chunks, 'binary');
                stream.on('finish', () => {
                    resolve('File Saved !');
                });
                res.pipe(stream);
            })
        }).on('error', (e) => {
            console.log("Error: " + e);
            reject(e.message);
        });
    })
};

function getFileExtension(filename) {
    return filename.split('.').pop();
}
function checkString(stuff,arr){
    let ret = false
    arr.forEach(stupid => {
        if(stuff.indexOf(stupid)>-1){
            ret = true
        }
    })
    return ret
}
module.exports.embeds = {
    color:"#c1b0e8"
}
module.exports.info = {
    prefix:prefix
}

//WEBSITE

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', function (req, res) {
	res.send('Hello World!');
});
     
app.listen(4000, function () {
	console.log('Example app listening on port 4000!');
});
function write(stream,data, cb) {
	if (!stream.write(data)) {
	  stream.once('drain', cb);
	} else {
	  process.nextTick(cb);
	}
}
app.post("/obfuscate",function(req,res){
	if(isObfuscating){
		res.send("Please wait for a script to finish obfuscating!")
	}else if(canObfuscate == true){
		isObfuscating = true
		var stream = fs.createWriteStream("AXR_in.lua");
		stream.on("error",function(x){console.log(x)})
		write(stream,req.body.toObfuscate, () => {
			console.log("Done")
                  child("java -jar "+__dirname+"\\ObfuscatorOUTPUT.jar", function(err, data) {
				try{
					child("lua mainHelpers\\minify.lua", {}, function(err, dataa) {
						fs.readFile("C:\\Users\\2022c\\Desktop\\coding\\DiscordBotTesting\\EncryptionBotv2\\AXR_out.lua",function(err,data){
							console.log(data)
							res.send(data)
							res.end()
							isObfuscating = false
						})
					});
				}catch(e){
					console.log(e)
					isObfuscating = false
					res.end()
				}
			});
			isObfuscating = false
		});

	}else if(canObfuscate==false){
		res.send("Sorry! The obfuscator is currently disabled")
		res.end()
	}
})