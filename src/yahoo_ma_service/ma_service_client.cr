require "./ma_result.cr"
require "http/client"
require "uri"
require "xml"

module YahooMAService
  class MAServiceClient
    def initialize(@id : String); end

    def parse(sentence : String) : MAResult
      response = HTTP::Client.post_form(URI.parse("http://jlp.yahooapis.jp/MAService/V1/parse"),
        {"appid" => @id, "sentence" => sentence, "results" => "ma"})
			doc = XML.parse(response.not_nil!.body.not_nil!).not_nil!
			ma_result_node = doc.children.not_nil!.find { |node| node.name == "ResultSet" }.not_nil!.children.not_nil!.find { |node| node.name == "ma_result" }.not_nil!
      return MAResult.from_xml_node(ma_result_node).not_nil!
    end
  end
end
