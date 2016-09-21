require 'spec_helper'

describe SmsTeknik::Message do

  it "can be initialized with from sender" do
    message = SmsTeknik::Message.new(from: "Sender")
    expect(message.from).to eq("Sender")
  end

  it "can be initialized with one to address" do
    message = SmsTeknik::Message.new(to: "+46700000000")
    expect(message.to).to eq(["+46700000000"])
  end

  it "can be initialized with one to address" do
    message = SmsTeknik::Message.new(to: ["+46700000000", "+46700000001"])
    expect(message.to).to eq(["+46700000000", "+46700000001"])
  end

  it "can be initialized with a body" do
    message = SmsTeknik::Message.new(body: "Hello, World!")
    expect(message.body).to eq("Hello, World!")
  end

end
