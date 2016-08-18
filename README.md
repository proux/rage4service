# rage4service
#### Promise-based communication with Rage4 API
[![npm](https://img.shields.io/npm/v/rage4service.svg?maxAge=2592000)](https://www.npmjs.com/package/rage4service)
[![npm](https://img.shields.io/npm/l/rage4service.svg?maxAge=2592000)](https://www.npmjs.com/package/rage4service)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

[![Build Status](https://travis-ci.org/proux/rage4service.svg?branch=master)](https://travis-ci.org/proux/rage4service)
[![Build status](https://ci.appveyor.com/api/projects/status/6pa6o5j87sc6f9ou/branch/master?svg=true)](https://ci.appveyor.com/project/nicolindemann/rage4service/branch/master)
[![Dependency Status](https://dependencyci.com/github/proux/rage4service/badge)](https://dependencyci.com/github/proux/rage4service)
[![Code Climate](https://codeclimate.com/github/proux/rage4service/badges/gpa.svg)](https://codeclimate.com/github/proux/rage4service)
[![Test Coverage](https://codeclimate.com/github/proux/rage4service/badges/coverage.svg)](https://codeclimate.com/github/proux/rage4service/coverage)
[![Known Vulnerabilities](https://snyk.io/test/npm/rage4service/badge.svg)](https://snyk.io/test/npm/rage4service)

**rage4service** is designed to be the simplest way to make calls to the API of Rage4 Networks.

## Installation

The library is available on [npm](https://www.npmjs.com/package/rage4service).
Install the module with:

```sh
npm install rage4service --save
```

## Usage
Create a new **rage4service** instance:
```javascript
Rage4service = require('rage4service');

var r4s = new Rage4service("username", "password");
```
## Credentials
The Rage4 API use your email adress as username and your API key as password. You can instantiate the **Rage4service** class without any credentials, in that case the environment variables `RAGE4_USERNAME` and `RAGE4_PASSWORD` are used. 

## Methods
All methods in the **Rage4service** class return promises. 
For more information on the various API endpoints (the corresponding method names are the same), see the [ API Documentation](https://gbshouse.uservoice.com/knowledgebase/articles/109834-rage4-dns-developers-api).

An example:
```javascript
r4s.getdomains().then(function(arrayOfAllDomains) {
    console.log(arrayOfAllDomains);
});
```
All methods, return values and parameters are documented in full [jsDoc](http://usejsdoc.org/) comments. 

## Issues
Feel free to open a github issue if you experience something odd.

> **Already known ambiguities:**

> - `updatedomain`: Use of `nsname` and `nsprefix` is unclear. Issue [#27](/../../issues/27)
> - `importdomainext`: Maybe a wrong description. [#26](/../../issues/26)

## License
MIT
