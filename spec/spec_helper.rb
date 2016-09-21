$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sms_teknik'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

SmsTeknik.logger.level = Logger::WARN
