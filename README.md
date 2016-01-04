resin-cli-errors
----------------

[![npm version](https://badge.fury.io/js/resin-cli-errors.svg)](http://badge.fury.io/js/resin-cli-errors)
[![dependencies](https://david-dm.org/resin-io/resin-cli-errors.png)](https://david-dm.org/resin-io/resin-cli-errors.png)
[![Build Status](https://travis-ci.org/resin-io/resin-cli-errors.svg?branch=master)](https://travis-ci.org/resin-io/resin-cli-errors)
[![Build status](https://ci.appveyor.com/api/projects/status/bv3j3fe5pe3dw7j6?svg=true)](https://ci.appveyor.com/project/resin-io/resin-cli-errors)

Resin.io CLI error interpreter.

Role
----

The intention of this module is to provide an error interpreter to translate common error codes to user friendly and more helpful messages.

Installation
------------

Install `resin-cli-errors` by running:

```sh
$ npm install --save resin-cli-errors
```

Documentation
-------------

<a name="module_errors.interpret"></a>
### errors.interpret(error) ⇒ <code>String</code>
**Kind**: static method of <code>[errors](#module_errors)</code>  
**Summary**: Interpet an error instance  
**Returns**: <code>String</code> - error message  
**Access:** public  

| Param | Type | Description |
| --- | --- | --- |
| error | <code>Error</code> | error |

**Example**  
```js
error = new Error()
error.code = 'ENOGIT'

message = errors.interpret(error)

console.log(message)
> Git is not installed on this system.
> Head over to http://git-scm.com to install it and run this command again.
```

Support
-------

If you're having any problem, please [raise an issue](https://github.com/resin-io/resin-cli-errors/issues/new) on GitHub and the Resin.io team will be happy to help.

Tests
-----

Run the test suite by doing:

```sh
$ gulp test
```

Contribute
----------

- Issue Tracker: [github.com/resin-io/resin-cli-errors/issues](https://github.com/resin-io/resin-cli-errors/issues)
- Source Code: [github.com/resin-io/resin-cli-errors](https://github.com/resin-io/resin-cli-errors)

Before submitting a PR, please make sure that you include tests, and that [coffeelint](http://www.coffeelint.org/) runs without any warning:

```sh
$ gulp lint
```

License
-------

The project is licensed under the Apache 2.0 license.
