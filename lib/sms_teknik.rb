require "logger"
require "sms_teknik/version"
require "sms_teknik/message"
require "sms_teknik/client"
require "sms_teknik/xml_templates"
require 'sms_teknik/railtie' if defined?(Rails)

module SmsTeknik
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  def self.logger=(value)
    @logger = value
  end
end
