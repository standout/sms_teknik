require 'spec_helper'

describe SmsTeknik::Client do

  it "should be initialized with id, username and password" do
    client = SmsTeknik::Client.new(id: "My Company", user: "Foo", pass: "Pass")
    expect(client.id).to eq("My Company")
    expect(client.user).to eq("Foo")
    expect(client.pass).to eq("Pass")
  end

  describe "#deliver" do
    it "sends a request to the API" do
      message = SmsTeknik::Message.new(to: "+46700000001", from: "The foos", body: "Hello")
      client = SmsTeknik::Client.new(id: "Foo", user: "User", pass: "Pass")

      stub_request(:post, "https://api.smsteknik.se/send/xml/?id=Foo&pass=Pass&user=User")
        .to_return(:status => 200, :body => "8989898")

      expect(client.deliver(message)).to eq(true)
    end
  end

  describe ".endpoint" do
    it "defaults to the official endpoint" do
      expect(SmsTeknik::Client.endpoint).to eq("https://api.smsteknik.se")
    end

    it "can be overwritten by other applications" do
      SmsTeknik::Client.endpoint = "http://my-proxy-gateway.local"
      expect(SmsTeknik::Client.endpoint).to eq("http://my-proxy-gateway.local")

      # reset
      SmsTeknik::Client.endpoint = nil
    end
  end
end
