'use strict'

rage4service = ->
  rp = require('request-promise')
  querystring = require('querystring')
  query = (action, params) ->
    rp
      uri: 'https://secure.rage4.com/RAPI/' + action + '/?' + querystring.stringify(params)
      auth:
        user: process.env.RAGE4_USERNAME
        pass: process.env.RAGE4_PASSWORD
      json: true

  {
    ###*
    # Lists all zones
    # @return {array}
    ###
    getdomains: () ->
      query 'getdomains', null

    ###*
    # Retrieve zone by ID
    # @param {object} params
    # @param {integer} params.id Domain's ID
    ###
    getdomain: (params) ->
      query 'getdomain', params
  }

module.exports = rage4service()
