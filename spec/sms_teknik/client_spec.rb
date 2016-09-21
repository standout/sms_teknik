require 'spec_helper'

describe SmsTeknik::Client do

  it "should be initialized with id, username and password" do
    client = SmsTeknik::Client.new(id: "My Company", user: "Foo", pass: "Pass")
    expect(client.id).to eq("My Company")
    expect(client.user).to eq("Foo")
    expect(client.pass).to eq("Pass")
  end

  describe "#deliver" do
    it "delivers SMS by sending a HTTP request"
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
