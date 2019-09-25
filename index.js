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
String.prototype.defs = function(key, n = 126) {
	// return String itself if the given parameters are invalid
	if (!(typeof(key) === 'number' && key % 1 === 0)
	  || !(typeof(key) === 'number' && key % 1 === 0)) {
	  return this.toString();
	}
    
	return this.toString().obfs(n - key);
};
bot.on("ready", async () => {
    bot.user.setActivity("with new obfuscation stuff", {type: "PLAYING"});
    console.log("Finished setup proccesses.")
});
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
			let nameOfFinal = "AXR_out.lua"//randomstring(20)
			let retr = await downloadAttachment(first.url,"AXR_in.lua")
			let userId = message.author.id
			//userId = main.encrypt(userId,iv,key)
			let parameters = "key:" + userId.obfs(16) + " "
			console.log(parameters)
			if(args.includes("compress")){
				parameters = parameters + "compress "
				//console.log("Compress enabled!")
			}
			try{
				child("java -jar "+__dirname+"/ObfuscatorOUTPUT.jar " + parameters, function(err, data) {
					let thingy = data.toString()
					if(thingy=="CODE\NCONSTANTS\NDEBUG\NFinished" || "CODE\NCONSTANTS\NDEBUG"){
						try{
							child("lua " + __dirname + "/mainHelpers/minify.lua", parameters, function(err, dataa) {
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
								let success = new discord.RichEmbed()
								success.setAuthor("AXR")
								success.setColor("#c1b0e8")
								success.setTitle("Obfuscator")
								success.setFooter("This message will auto delete in 30 seconds for security reasons")
								success.setTimestamp()
								success.addField(":moneybag: Finished Obfuscating :moneybag:",`Estimated obfuscation count: ${data["OBF_STATS"].times}`)
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
					}else{
						message.channel.send(`AxR has detected errors in your code, please test it and make sure everything works. If this error persists please contact the owner`)
					}
				});
				isObfuscating = false
			}catch(e){
				isObfuscating = false
				console.log(e)
			}
			isObfuscating = false
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
module.exports.embeds = {
    color:"#c1b0e8"
}
module.exports.info = {
    prefix:prefix,
    directory:__dirname
}

/*setInterval(function(){
	isObfuscating = false
},1000)*/
//WEBSITE

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded
app.use(express.static(__dirname))
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');
app.set("trust proxy")
app.listen(port, function () {
	app.get('/', function (req, res) {
		res.render("index.ejs")
	});
	app.get("/discord",function(req,res){
		res.redirect("https://discord.gg/invite/3y7XbzR")
	})

	app.get("/scripts/hub",function(req,res){
		res.sendFile(__dirname + "/views/scripts/hub.txt")
	})
	app.get("/scripts/ui",function(req,res){
		res.sendFile(__dirname + "/views/scripts/ui.txt")
	})
});
