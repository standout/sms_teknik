require 'net/http'
require 'net/https'

module SmsTeknik
  class Client
    attr_accessor :id, :user, :pass

    def initialize(options = {})
      @id = options[:id]
      @user = options[:user]
      @pass = options[:pass]
    end

    def deliver(message)
      req =  Net::HTTP::Post.new(uri)
      req.add_field "Content-Type", "text/xml"
      req.body = SmsTeknik::XMLTemplates.text_message(
        recipients: message.to,
        message: message.body,
        sender: message.from,
        send_date: Time.now.strftime("%Y-%m-%d"),
        send_time: Time.now.strftime("%H:%M")
      )

      # Fetch Request
      res = http.request(req)
      SmsTeknik.logger.info "[SmsTeknik] Message sent with status #{res.code} and response \"#{res.body}\""
      return true
    rescue StandardError => e
      SmsTeknik.logger.error "[SmsTeknik] HTTP Request failed (#{e.message})"
      return false
    end

    def self.endpoint
      @endpoint || "https://api.smsteknik.se"
    end

    def self.endpoint=(value)
      @endpoint = value
    end

    private

    def uri
      params = URI.encode_www_form(id: id, user: user, pass: pass)
      URI("#{self.class.endpoint}/send/xml/?#{params}")
    end

    def http
      Net::HTTP.new(uri.host, uri.port).tap do |h|
        h.use_ssl = true
        h.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end
  end
end