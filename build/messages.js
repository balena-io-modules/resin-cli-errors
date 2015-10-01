
/*
The MIT License

Copyright (c) 2015 Resin.io, Inc. https://resin.io.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
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
  }
};
