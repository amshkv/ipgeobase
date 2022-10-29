# frozen_string_literal: true

require 'test_helper'

class TestIpgeobase < Minitest::Test
  def test_full_data
    url = Ipgeobase.build_url('8.8.8.8')
    file = File.read('test/fixtures/response.xml')
    stub_request(:get, url).to_return(body: file)

    ip_meta = Ipgeobase.lookup('8.8.8.8')

    assert_equal 'Ashburn', ip_meta.city
    assert_equal 'United States', ip_meta.country
    assert_equal 'US', ip_meta.country_code
    assert_equal '39.03', ip_meta.lat
    assert_equal '-77.5', ip_meta.lon
  end
end
