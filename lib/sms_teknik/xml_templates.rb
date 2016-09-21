module SmsTeknik
  module XMLTemplates

    def self.text_message(attributes = {})
      recipients = attributes[:recipients]
      message = attributes[:message]
      sender = attributes[:sender]
      send_date = attributes[:send_date]
      send_time = attributes[:send_time]

      <<-XML
<?xml version="1.0" ?>
<sms-teknik>
  <operationtype>0</operationtype>
  <flash>0</flash>
  <multisms>1</multisms>
  <maxmultisms>0</maxmultisms>
  <ttl>0</ttl>
  <customid>1</customid>
  <compresstext>0</compresstext>
  <send_date>#{send_date}</send_date>
  <send_time>#{send_time}</send_time>
  <udh></udh>
  <udmessage><![CDATA[#{message}]]></udmessage>
  <smssender>#{sender}</smssender>
  <deliverystatustype>0</deliverystatustype>
  <deliverystatusaddress></deliverystatusaddress>
  <usereplynumber>0</usereplynumber>
  <usereplyforwardtype>0</usereplyforwardtype>
  <usereplyforwardurl></usereplyforwardurl>
  <usereplycustomid></usereplycustomid>
  <usereplysmp>0</usereplysmp>
  <usee164>0</usee164>
  <items>
#{recipients_partial(recipients)}  </items>
</sms-teknik>
XML
    end

    private

    def self.recipients_partial(recipients)
      recipients.map { |recipient|
        <<-XML
    <recipient>
      <nr>#{recipient}</nr>
    </recipient>
XML
      }.join("\n")
    end

  end
end

