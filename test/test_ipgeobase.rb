# frozen_string_literal: true

require 'test_helper'

class TestIpgeobase < Minitest::Test
  def test_full_data
    ip = '8.8.8.8'
    url = "http://ip-api.com/xml/#{ip}?fields=country,countryCode,city,lat,lon"
    response = load_fixture('response')
    stub_request(:get, url).to_return(body: response)

    ip_meta = Ipgeobase.lookup(ip)

    assert_equal('Ashburn', ip_meta.city)
    assert_equal('United States', ip_meta.country)
    assert_equal('US', ip_meta.countryCode)
    assert_equal(39.03, ip_meta.lat)
    assert_equal(-77.5, ip_meta.lon)
  end
end
