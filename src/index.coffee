'use strict'

rp = require('request-promise')
querystring = require('querystring')

###*
# @typedef Domain
# @property {integer} id          - ID
# @property {string} name         - Domain name
# @property {string} owner_email  - Owners Email
# @property {integer} type        - Type
# @property {integer} subnet_mask - Subnet Mask
# @property {string} default_ns1  - Default Nameserver 1
# @property {string} default_ns2  - Default Nameserver 2
###

###*
# @typedef ApiResponse
# @property {boolean} status - Response Status
# @property {integer} id     - ID
# @property {string} error   - Error Message
###

rage4service = ->
  query = (action, params) ->
    rp
      uri: 'https://secure.rage4.com/RAPI/' + action +
        '/?' + querystring.stringify(params)
      auth:
        user: process.env.RAGE4_USERNAME
        pass: process.env.RAGE4_PASSWORD
      json: true

  {
    ###*
    # Return current server time (UTC)
    # @return {{utctime: string, version: string}}
    ###
    index: () ->
      query 'index', null

    ###*
    # Lists all zones
    # @return {Array.<Domain>}
    ###
    getdomains: () ->
      query 'getdomains', null

    ###*
    # Retrieve zone by ID
    # @param {object} params
    # @param {integer} params.id - Domain's ID
    # @return {Domain} Zone
    ###
    getdomain: (params) ->
      query 'getdomain', params

    ###*
    # Retrieve zone by Domainname
    # @param {object} params
    # @param {string} params.name - Domain's name
    # @return {Domain} Zone
    ###
    getdomainbyname: (params) ->
      query 'getdomainbyname', params

    ###*
    # Create regular zone
    # @param {object} params
    # @param {string} params.name       - Domain's name
    # @param {string} params.email      - Administrator's email address
    # @param {boolean} params.apiaccess - Allow API access
    # @param {string} params.ns1        - Primary NS name
    # @param {string} params.ns2        - Secondary NS name
    # @return {ApiResponse} Response
    ###
    createregulardomain: (params) ->
      query 'createregulardomain', params

    ###*
    # Create reverse zone (IPv4)
    # @param {object} params
    # @param {string} params.name    - Domain's name
    # @param {string} params.email   - Administrator's email address
    # @param {integer} params.subnet - Subnet size
    # @return {ApiResponse} Response
    ###
    createreversedomain4: (params) ->
      query 'createreversedomain4', params

    ###*
    # Create reverse zone (IPv6)
    # @param {object} params
    # @param {string} params.name    - Domain's name
    # @param {string} params.email   - Administrator's email address
    # @param {integer} params.subnet - Subnet size
    # @return {ApiResponse} Response
    ###
    createreversedomain6: (params) ->
      query 'createreversedomain6', params

    ###*
    # Delete a zone
    # @param {object} params
    # @param {integer} params.id - Domain's ID
    # @return {ApiResponse} Response
    ###
    deletedomain: (params) ->
      query 'deletedomain', params

    ###*
    # Update a zone
    # @param {object} params
    # @param {integer} params.id        - Domain's ID
    # @param {string} params.email      - Administrator's email address
    # @param {boolean} params.apiaccess - Allow API access
    # @param {string} params.ns1        - Primary NS name
    # @param {string} params.ns2        - Secondary NS name
    # @param {boolean} selfResponse     - Self-Response
    # @return {ApiResponse|Domain} Response
    # @todo nsname, nsprefix
    ###
    updatedomain: (params, selfResponse) ->
      if (selfResponse)
        query 'updatedomain2', params
      else
        query 'updatedomain', params

    ###*
    # Import zone using AXFR
    # @param {object} params
    # @param {string} params.name - Domain's name
    # @return {ApiResponse} Reponse
    ###
    importdomain: (params) ->
      query 'importdomain', params

    ###*
    # Import zone using AXFR and set vanity NS
    # @param {object} params
    # @param {string} params.name     - Domain's name
    # @param {string} params.nsname   - NS prefix
    # @param {string} params.nsprefix - NS suffix
    # @todo Wrong description in API?
    # @return {ApiResponse} Reponse
    ###
    importdomainext: (params) ->
      query 'importdomainext', params

    ###*
    # Sync zone to specific Shadow Master server
    # @param {object}  params
    # @param {string}  params.name   - Domain's name
    # @param {string}  params.server - Shadow master's IPv4 address
    # @param {boolean} params.dnssec - Enable DNSSEC
    # @return {ApiResponse} Reponse
    ###
    syncdomain: (params) ->
      query 'syncdomain', params

    ###*
    # Sync slave zone to specific Shadow Master server
    # @param {object}  params
    # @param {string}  params.name   - Domain's name
    # @param {string}  params.server - Shadow master's IPv4 address
    # @param {boolean} params.dnssec - Enable DNSSEC
    # @return {ApiResponse} Reponse
    ###
    syncslavedomain: (params) ->
      query 'syncslavedomain', params
  }

module.exports = rage4service()
