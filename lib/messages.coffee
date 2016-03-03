###
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
###

os = require('os')

###*
# @summary Error messages
# @namespace messages
# @private
###
module.exports =

	###*
	# @property {Function} EISDIR
	# @memberof messages
	###
	EISDIR: (error) ->
		return "File is a directory: #{error.path}"

	###*
	# @property {Function} ENOENT
	# @memberof messages
	###
	ENOENT: (error) ->
		return "No such file or directory: #{error.path}"

	###*
	# @property {Function} ENOGIT
	# @memberof messages
	###
	ENOGIT: ->
		return '''
			Git is not installed on this system.
			Head over to http://git-scm.com to install it and run this command again.
		'''

	###*
	# @property {Function} EPERM
	# @memberof messages
	###
	EPERM: ->
		message = 'You don\'t have enough privileges to run this operation.\n'

		if os.platform() is 'win32'
			message += 'Run a new Command Prompt as administrator and try running this command again.'
		else
			message += 'Try running this command again prefixing it with `sudo`.'

		message += '\n\nIf this is not the case, and you\'re trying to burn an SDCard, check that the write lock is not set.'

		return message

	###*
	# @property {Function} EACCES
	# @memberof messages
	###
	EACCES: ->
		return @EPERM()

	###*
	# @property {Function} ETIMEDOUT
	# @memberof messages
	###
	ETIMEDOUT: ->
		return 'Oops something went wrong, please check your connection and try again.'

	ResinExpiredToken: ->
		return '''
			Looks like your session token is expired.

			Please try logging in again with:

				$ resin login
		'''
