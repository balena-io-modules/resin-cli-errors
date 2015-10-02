###
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
###

###*
# @module errors
###

_ = require('lodash')
messages = require('./messages')

###*
# @summary Interpet an error instance
# @function
# @public
#
# @param {Error} error - error
# @returns {String} error message
#
# @example
# error = new Error()
# error.code = 'ENOGIT'
#
# message = errors.interpret(error)
#
# console.log(message)
# > Git is not installed on this system.
# > Head over to http://git-scm.com to install it and run this command again.
###
exports.interpret = (error) ->
	return if error not instanceof Error
	message = messages[error.code]?.call(messages, error)
	return message if message?

	if not _.isEmpty(error.message)
		if error.code?
			return "#{error.code}: #{error.message}"
		else
			return error.message
