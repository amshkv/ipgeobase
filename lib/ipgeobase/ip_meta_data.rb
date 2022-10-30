# frozen_string_literal: true

require 'happymapper'

module Ipgeobase
  class IpMetaData
    include HappyMapper

    tag 'query'
    element :country, String
    element :countryCode, String, tag: 'countryCode'
    element :city, String
    element :lat, Float
    element :lon, Float
  end
end
