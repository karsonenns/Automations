#! /usr/bin/env node
const xcall = require('xcall');
const client = new xcall('bear');
const fs = require('fs');

const SlackToDoFile = '/Users/karson/Dropbox/IFTTT/SlackToDo.txt'
let SlackData = fs.readFileSync(SlackToDoFile, { encoding: 'utf8' });
let SlackDataJSON = JSON.parse(JSON.parse(SlackData).payload)


function isValid(data){
    if(data.user.username != 'karson'){
        console.log(data.user.username);
        return false
    }

    if(data.callback_id != 'mark_todo'){
        console.log(data.user.username);
        return false
    }

    return true
}

function handle(){

    //Validation
    if (!isValid(SlackDataJSON)) return false

    client.call('add-text', {
        id: "01BF43C0-3058-4923-9904-85237C8F25AD-70741-000219FC991A01FD",
        text: `- ${SlackDataJSON.message.text} @ ${new Date().toLocaleDateString()}`,
        mode: 'prepend'
    })
}


handle()




