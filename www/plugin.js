
var exec = require('cordova/exec');

var PLUGIN_NAME = 'SystemSound';

var SystemSound = {
    playSound: function(cb) {
        exec(cb, null, PLUGIN_NAME, 'playSound', []);
    }
};

module.exports = SystemSound;
