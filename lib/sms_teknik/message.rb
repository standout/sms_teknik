module SmsTeknik
  class Message
    attr_accessor :from, :to, :body

    def initialize(attributes = {})
      @from = attributes[:from]
      @to = attributes[:to]
      @body = attributes[:body]
    end

    def to
      Array(@to)
    end

  end
end