# frozen_string_literal: true

require_relative 'ipgeobase/version'
require 'addressable/template'
require 'net/http'
require 'happymapper'

module Ipgeobase
  def self.lookup(ip)
    url = build_url(ip)
    response = Net::HTTP.get(url)
    HappyMapper.parse(response)
  end

  def self.build_url(ip)
    url = Addressable::Template.new('{scheme}://{host}/{type}/{ip}?{fields*}')
    url.expand({
                 scheme: 'http',
                 host: 'ip-api.com',
                 type: 'xml',
                 ip:,
                 fields: {
                   fields: 'country,countryCode,city,lat,lon'
                 }
               })
  end
end
