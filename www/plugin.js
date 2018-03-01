var exec = require('cordova/exec');

var PLUGIN_NAME = 'SystemSound';

var SystemSound = {
    playSound: function(phrase, directory, cb) {
        exec(cb, null, PLUGIN_NAME, 'playSound', [phrase, directory]);
    },
};

module.exports = SystemSound;
