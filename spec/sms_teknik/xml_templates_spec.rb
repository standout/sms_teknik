require 'spec_helper'

describe SmsTeknik::XMLTemplates do
  describe ".text_message" do
    it "has correct XML" do
      expected = <<XML
<?xml version="1.0" ?>
<sms-teknik>
  <operationtype>0</operationtype>
  <flash>0</flash>
  <multisms>1</multisms>
  <maxmultisms>0</maxmultisms>
  <ttl>0</ttl>
  <customid>1</customid>
  <compresstext>0</compresstext>
  <send_date>2019-09-08</send_date>
  <send_time>15:00</send_time>
  <udh></udh>
  <udmessage><![CDATA[Hello, World!]]></udmessage>
  <smssender>FooBar AB</smssender>
  <deliverystatustype>0</deliverystatustype>
  <deliverystatusaddress></deliverystatusaddress>
  <usereplynumber>0</usereplynumber>
  <usereplyforwardtype>0</usereplyforwardtype>
  <usereplyforwardurl></usereplyforwardurl>
  <usereplycustomid></usereplycustomid>
  <usereplysmp>0</usereplysmp>
  <usee164>0</usee164>
  <items>
    <recipient>
      <nr>+46700000000</nr>
    </recipient>
  </items>
</sms-teknik>
XML
      template = SmsTeknik::XMLTemplates.text_message(
        recipients: ["+46700000000"],
        message: "Hello, World!",
        sender: "FooBar AB",
        send_date: "2019-09-08",
        send_time: "15:00"
      )

      expect(template).to eq(expected)
    end
  end
end