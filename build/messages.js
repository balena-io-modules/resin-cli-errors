
/*
Copyright 2016 Resin.io

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */
var os;

os = require('os');


/**
 * @summary Error messages
 * @namespace messages
 * @private
 */

module.exports = {

  /**
  	 * @property {Function} EISDIR
  	 * @memberof messages
   */
  EISDIR: function(error) {
    return "File is a directory: " + error.path;
  },

  /**
  	 * @property {Function} ENOENT
  	 * @memberof messages
   */
  ENOENT: function(error) {
    return "No such file or directory: " + error.path;
  },

  /**
  	 * @property {Function} ENOGIT
  	 * @memberof messages
   */
  ENOGIT: function() {
    return 'Git is not installed on this system.\nHead over to http://git-scm.com to install it and run this command again.';
  },

  /**
  	 * @property {Function} EPERM
  	 * @memberof messages
   */
  EPERM: function() {
    var message;
    message = 'You don\'t have enough privileges to run this operation.\n';
    if (os.platform() === 'win32') {
      message += 'Run a new Command Prompt as administrator and try running this command again.';
    } else {
      message += 'Try running this command again prefixing it with `sudo`.';
    }
    message += '\n\nIf this is not the case, and you\'re trying to burn an SDCard, check that the write lock is not set.';
    return message;
  },

  /**
  	 * @property {Function} EACCES
  	 * @memberof messages
   */
  EACCES: function() {
    return this.EPERM();
  },

  /**
  	 * @property {Function} ETIMEDOUT
  	 * @memberof messages
   */
  ETIMEDOUT: function() {
    return 'Oops something went wrong, please check your connection and try again.';
  },
  ResinExpiredToken: function() {
    return 'Looks like your session token is expired.\n\nPlease try logging in again with:\n\n	$ resin login';
  }
};
