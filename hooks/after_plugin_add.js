#!/usr/bin/env node

var fs = require('fs-extra');
var path = require('path');

module.exports = function (context) {
    try {
        // Assuming you want to perform actions for the iOS platform
        var platform = 'ios';

        var projectName = getProjectName(context);

        if (projectName) {
            // Adjust srcDir to point to the correct source folder within the plugin
            var srcDir = path.join(context.opts.projectRoot, 'plugins', 'cordova-ekare-measurement-sdk-plugin', 'src', platform, 'Frameworks');
            var destDir = path.join(context.opts.projectRoot, 'platforms', platform, projectName, 'Frameworks');

            // Ensure the destination directory exists
            fs.ensureDirSync(destDir);

            // Copy files from src/ios/Frameworks to the destination directory
            fs.copySync(srcDir, destDir);

            console.log('Files copied successfully from ' + srcDir + ' to platforms/' + platform + '/' + projectName + '/Frameworks');
        } else {
            console.error('Unable to determine Cordova project name. Please check your project setup.');
        }
    } catch (error) {
        console.error('Error in the script:', error);
    }
};

function getProjectName(context) {
    var configXmlPath = path.join(context.opts.projectRoot, 'config.xml');
    
    if (fs.existsSync(configXmlPath)) {
        var configXmlContent = fs.readFileSync(configXmlPath, 'utf-8');
        var match = /<name>(.*?)<\/name>/i.exec(configXmlContent);

        if (match && match[1]) {
            return match[1].trim();
        }
    }

    return null;
}
