# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'ipgeobase'

require 'minitest/autorun'
require 'webmock/minitest'

def load_fixture(name)
  File.read("test/fixtures/#{name}.xml")
end
