# frozen_string_literal: true

require_relative 'ipgeobase/version'
require_relative 'ipgeobase/response_presenter'
require 'addressable/template'
require 'net/http'
module Ipgeobase
  def self.lookup(ip)
    url = build_url(ip)
    response = Net::HTTP.get(url)
    ResponsePresenter.parse(response)
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
