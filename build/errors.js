
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

/**
 * @module errors
 */
var messages, _;

_ = require('lodash');

messages = require('./messages');


/**
 * @summary Interpet an error instance
 * @function
 * @public
 *
 * @param {Error} error - error
 * @returns {String} error message
 *
 * @example
 * error = new Error()
 * error.code = 'ENOGIT'
 *
 * message = errors.interpret(error)
 *
 * console.log(message)
 * > Git is not installed on this system.
 * > Head over to http://git-scm.com to install it and run this command again.
 */

exports.interpret = function(error) {
  var message, _ref;
  if (!(error instanceof Error)) {
    return;
  }
  message = (_ref = messages[error.code]) != null ? _ref.call(messages, error) : void 0;
  if (message != null) {
    return message;
  }
  if (!_.isEmpty(error.message)) {
    if (error.code != null) {
      return "" + error.code + ": " + error.message;
    } else {
      return error.message;
    }
  }
};
