let exec = require('cordova/exec');

let PLUGIN_NAME = 'SystemSound';

let SystemSound = {
    playSound: function(phrase, directory, cb) {
        exec(cb, null, PLUGIN_NAME, 'playSound', [phrase, directory]);
    },
};

module.exports = SystemSound;
