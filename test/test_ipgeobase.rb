# frozen_string_literal: true

require 'test_helper'

class TestIpgeobase < Minitest::Test
  def test_full_data
    url = 'http://ip-api.com/xml/8.8.8.8?fields=country,countryCode,city,lat,lon'
    response = load_fixture('response')
    stub_request(:get, url).to_return(body: response)

    ip_meta = Ipgeobase.lookup('8.8.8.8')

    assert_equal 'Ashburn', ip_meta.city
    assert_equal 'United States', ip_meta.country
    assert_equal 'US', ip_meta.country_code
    assert_equal '39.03', ip_meta.lat
    assert_equal '-77.5', ip_meta.lon
  end

  def test_build_url
    builded_url = Ipgeobase.build_url('8.8.8.8').to_s
    expected_url = 'http://ip-api.com/xml/8.8.8.8?fields=country%2CcountryCode%2Ccity%2Clat%2Clon'
    assert_equal builded_url, expected_url
  end
end
