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
# @typedef Record
# @property {integer} id
# @property {string} name
# @property {string} content
# @property {string} type
# @property {integer} ttl
# @property {integer} priority
# @property {integer} domain_id
# @property {integer} geo_region_id
# @property {double} geo_lat
# @property {double} geo_long
# @property {booelan} failover_enabled
# @property {booelan} failover_active
# @property {string} failover_content
# @property {booelan} failover_withdraw
# @property {integer} webhook_id
# @property {booelan} is_active
# @property {boolean} udp_limit
###

###*
# @typedef ApiResponse
# @property {boolean} status - Response Status
# @property {integer} id     - ID
# @property {string} error   - Error Message
###

###*
# @typedef WebHook
# @property {integer} id  - ID
# @property {string} name - WebHook Name
# @property {string} key  - WebHook Key
###

###*
# @typedef ApiDictionary
# @property {string} name  - Name
# @property {integer} value - Value
###

###*
# @typedef ApiDateDictionary
# @property {string} date   - Date
# @property {integer} value - Value
###

###*
# @typedef DomainLogDaily
# @property {string} date_created   - DateTime
# @property {integer} totel - Total Usage
# @property {integer} eu - EU Usage
# @property {integer} us - US Usage
# @property {integer} sa - SA Usage
# @property {integer} ap - AP Usage
# @property {integer} af - AF Usage
###

###*
# @typedef SecureKey
# @property {integer} keytag   - Key tag
# @property {string} key       - Key
# @property {string} algorithm - Algorithm
# @property {string} rsasha1   - RSA SHA1 Hash
# @property {string} rsasha256 - RSA SHA256 Hash
# @property {string} dnskey    - DNS Key
###

rage4service = (username = process.env.RAGE4_USERNAME,
   password = process.env.RAGE4_PASSWORD) ->
     query = (action, params) ->
       rp
         uri: 'https://secure.rage4.com/RAPI/' + action +
           '/?' + querystring.stringify(params)
         auth:
           user: username
           pass: password
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

        ###*
        # Export BIND compatible zone file
        # @param {object}  params
        # @param {string}  params.id   - Domain's ID
        # @return {string} Reponse
        ###
        exportzonefile: (params) ->
          query 'exportzonefile', params

        ###*
        # Get DNSSEC details
        # @param {object}  params
        # @param {string}  params.id   - Domain's ID
        # @return {SecureKey} Reponse
        ###
        getdnssecinfo: (params) ->
          query 'getdnssecinfo', params

        ###*
        # Enable DNSSEC
        # @param {object}  params
        # @param {string}  params.id   - Domain's ID
        # @return {SecureKey} Reponse
        ###
        enablednssec: (params) ->
          query 'enablednssec', params

        ###*
        # Disable DNSSEC
        # @param {object}  params
        # @param {string}  params.id   - Domain's ID
        # @return {ApiResponse} Reponse
        ###
        disablednssec: (params) ->
          query 'disablednssec', params

        ###*
        # List records
        # @param {object}  params
        # @param {string}  params.id   - Domain's ID
        # @param {string}  params.name - Record's name
        # @return {Array.<Record>} Reponse
        ###
        getrecords: (params) ->
          query 'getrecords', params

        ###*
        # Get record by id
        # @param {object}  params
        # @param {string}  params.id   - Record's ID
        # @return {Record} Reponse
        ###
        getrecord: (params) ->
          query 'getrecord', params

        ###*
        # Create record
        # @param {object} params
        # @param {integer} params.id               - Domain's ID
        # @param {string} params.name
        # @param {string} params.content
        # @param {string} params.type
        # @param {integer} params.ttl
        # @param {integer} params.priority
        # @param {boolean} params.active
        # @param {integer} params.geozone          -
        # @param {boolean} params.geolock          -
        # @param {double} params.geolat            -
        # @param {double} params.geolong           -
        # @param {booelan} params.failover         -
        # @param {string} params.failovercontent   -
        # @param {boolean} params.failoverwithdraw -
        # @param {boolean} params.udplimit         -
        # @param {boolean} selfResponse            - Self-Response
        # @return {ApiResponse|Record} Response
        ###
        createrecord: (params, selfResponse) ->
          if (selfResponse)
            query 'createrecord2', params
          else
            query 'createrecord', params

        ###*
        # Update record
        # @param {object} params
        # @param {integer} params.id               - Records's's ID
        # @param {string} params.name
        # @param {string} params.content
        # @param {integer} params.ttl
        # @param {integer} params.priority
        # @param {boolean} params.active
        # @param {integer} params.geozone          -
        # @param {boolean} params.geolock          -
        # @param {double} params.geolat            -
        # @param {double} params.geolong           -
        # @param {booelan} params.failover         -
        # @param {string} params.failovercontent   -
        # @param {boolean} params.failoverwithdraw -
        # @param {boolean} params.udplimit         -
        # @param {boolean} selfResponse            - Self-Response
        # @return {ApiResponse|Record} Response
        ###
        updaterecord: (params, selfResponse) ->
          if (selfResponse)
            query 'updaterecord2', params
          else
            query 'updaterecord', params

        ###*
        # Delete record
        # @param {object}  params
        # @param {integer}  params.id   - Record's ID
        # @return {ApiResponse|Record} Response
        ###
        deleterecord: (params, selfResponse) ->
          if (selfResponse)
            query 'deleterecord2', params
          else
            query 'deleterecord', params

        ###*
        # Enable or disable record failover
        # @param {object}  params
        # @param {integer}  params.id     - Record's ID
        # @param {boolean} params.active -
        # @return {ApiResponse|Record} Response
        ###
        recordfailover: (params, selfResponse) ->
          if (selfResponse)
            query 'recordfailover2', params
          else
            query 'recordfailover', params

        ###*
        # Enable or disable record
        # @param {object}  params
        # @param {integer}  params.id     - Record's ID
        # @return {ApiResponse|Record} Response
        ###
        togglerecord: (params, selfResponse) ->
          if (selfResponse)
            query 'togglerecord2', params
          else
            query 'togglerecord', params

        ###*
        # List Webhooks
        # @return {Array.<WebHook>} Reponse
        ###
        getwebhooks: () ->
          query 'getwebhooks'

        ###*
        # Get webhook by id
        # @param {object}  params
        # @param {integer}  params.id   - Webhook's ID
        # @return {WebHook} Reponse
        ###
        getwebhook: (params) ->
          query 'getwebhook', params

        ###*
        # Create new webhook
        # @param {object}  params
        # @param {integer}  params.name   - Webhook's name
        # @return {ApiResponse} Reponse
        ###
        createwebhook: (params) ->
          query 'createwebhook', params

        ###*
        # Delete webhook by id
        # @param {object}  params
        # @param {integer}  params.id   - Webhook's ID
        # @return {ApiResponse} Reponse
        ###
        deletewebhook: (params) ->
          query 'deletewebhook', params

        ###*
        # Attach webhook to record
        # @param {object}  params
        # @param {integer}  params.id   - Webhook's ID
        # @return {ApiResponse} Reponse
        ###
        attachwebhook: (params) ->
          query 'attachwebhook', params

        ###*
        # Detach webhook from record
        # @param {object}  params
        # @param {integer}  params.id   - Webhook's ID
        # @return {ApiResponse} Reponse
        ###
        detachwebhook: (params) ->
          query 'detachwebhook', params

        ###*
        # List supported record types
        # @return {Array.<ApiDictionary>} Reponse
        ###
        listrecordtypes: () ->
          query 'listrecordtypes'

        ###*
        # List supported geo regions
        # @return {Array.<ApiDictionary>} Reponse
        ###
        listgeoregions: () ->
          query 'listgeoregions'

        ###*
        # Show current usage (single zone)
        # @param {object}  params
        # @param {integer}  params.id   - Domains's ID
        # @return {Array.<DomainLogDaily>} Reponse
        ###
        showcurrentusage: (params) ->
          query 'showcurrentusage', params

        ###*
        # Show current global usage (all zones)
        # @return {Array.<ApiDateDictionary>} Reponse
        ###
        showcurrentglobalusage: () ->
          query 'showcurrentglobalusage'

      }

module.exports = rage4service
