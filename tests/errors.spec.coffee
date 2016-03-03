m = require('mochainon')
os = require('os')
sdkErrors = require('resin-errors')
errors = require('../lib/errors')

describe 'Errors:', ->

	it 'should interpret EISDIR', ->
		error = new Error()
		error.code = 'EISDIR'
		error.path = 'foo'

		message = errors.interpret(error)
		m.chai.expect(message).to.equal('File is a directory: foo')

	it 'should interpret ENOENT', ->
		error = new Error()
		error.code = 'ENOENT'
		error.path = 'foo'

		message = errors.interpret(error)
		m.chai.expect(message).to.equal('No such file or directory: foo')

	it 'should interpret ENOGIT', ->
		error = new Error()
		error.code = 'ENOGIT'
		error.path = 'foo'

		message = errors.interpret(error)
		m.chai.expect(message).to.equal '''
			Git is not installed on this system.
			Head over to http://git-scm.com to install it and run this command again.
		'''

	it 'should interpret ETIMEDOUT', ->
		error = new Error()
		error.code = 'ETIMEDOUT'

		message = errors.interpret(error)
		m.chai.expect(message).to.equal('Oops something went wrong, please check your connection and try again.')

	describe 'given windows', ->

		beforeEach ->
			@osPlatformStub = m.sinon.stub(os, 'platform')
			@osPlatformStub.returns('win32')

		afterEach ->
			@osPlatformStub.restore()

		it 'should interpret EPERM', ->
			error = new Error()
			error.code = 'EPERM'
			error.path = 'foo'

			message = errors.interpret(error)
			m.chai.expect(message).to.equal '''
				You don\'t have enough privileges to run this operation.
				Run a new Command Prompt as administrator and try running this command again.

				If this is not the case, and you're trying to burn an SDCard, check that the write lock is not set.
			'''

		it 'should interpret EACCES', ->
			error = new Error()
			error.code = 'EACCES'
			error.path = 'foo'

			message = errors.interpret(error)
			m.chai.expect(message).to.equal '''
				You don\'t have enough privileges to run this operation.
				Run a new Command Prompt as administrator and try running this command again.

				If this is not the case, and you're trying to burn an SDCard, check that the write lock is not set.
			'''

	describe 'given non windows', ->

		beforeEach ->
			@osPlatformStub = m.sinon.stub(os, 'platform')
			@osPlatformStub.returns('linux')

		afterEach ->
			@osPlatformStub.restore()

		it 'should interpret EPERM', ->
			error = new Error()
			error.code = 'EPERM'
			error.path = 'foo'

			message = errors.interpret(error)
			m.chai.expect(message).to.equal '''
				You don\'t have enough privileges to run this operation.
				Try running this command again prefixing it with `sudo`.

				If this is not the case, and you're trying to burn an SDCard, check that the write lock is not set.
			'''

		it 'should interpret EACCES', ->
			error = new Error()
			error.code = 'EACCES'
			error.path = 'foo'

			message = errors.interpret(error)
			m.chai.expect(message).to.equal '''
				You don\'t have enough privileges to run this operation.
				Try running this command again prefixing it with `sudo`.

				If this is not the case, and you're trying to burn an SDCard, check that the write lock is not set.
			'''

		it 'should interpret ResinExpiredToken', ->
			error = new sdkErrors.ResinExpiredToken('1234')
			message = errors.interpret(error)
			m.chai.expect(message).to.equal '''
				Looks like your session token is expired.

				Please try logging in again with:

					$ resin login
			'''

		it 'should return undefined given an unknown error without a message', ->
			error = new Error()
			message = errors.interpret(error)
			m.chai.expect(message).to.be.undefined

		it 'should return the message given an error without a code', ->
			error = new Error()
			error.message = 'Hello World'
			message = errors.interpret(error)
			m.chai.expect(message).to.equal('Hello World')

		it 'should return the message along with the code given a non recognised error', ->
			error = new Error()
			error.message = 'Hello World'
			error.code = 'EFOO'
			message = errors.interpret(error)
			m.chai.expect(message).to.equal('EFOO: Hello World')

	describe 'given invalid inputs', ->

		it 'should return undefined if object is not an instance of Error', ->
			message = errors.interpret(code: 'ENOENT', message: 'ENOENT', path: '/foo/bar')
			m.chai.expect(message).to.be.undefined

		it 'should return undefined if input does not exist', ->
			message = errors.interpret()
			m.chai.expect(message).to.be.undefined

		it 'should return undefined if input is an array', ->
			message = errors.interpret([ 'ENOENT' ])
			m.chai.expect(message).to.be.undefined
