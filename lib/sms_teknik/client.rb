module SmsTeknik
  class Client
    attr_accessor :id, :user, :pass

    def initialize(options = {})
      @id = options[:id]
      @user = options[:user]
      @pass = options[:pass]
    end

    def deliver(message)
      raise NotImplementedError
    end

    def self.endpoint
      @endpoint || "https://api.smsteknik.se"
    end

    def self.endpoint=(value)
      @endpoint = value
    end
  end
end