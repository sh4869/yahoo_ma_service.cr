require "./result_set"
require "http/client"
require "uri"
require "xml"

module YahooMAService
  class MAServiceClient
    def initialize(@id : String); end

    def parse(sentence : String) : ResultSet
      response = HTTP::Client.post_form(URI.parse("http://jlp.yahooapis.jp/MAService/V1/parse"),
        {"appid" => @id, "sentence" => sentence, "results" => "ma,uniq"})
      doc = XML.parse(response.not_nil!.body.not_nil!).not_nil!
      result_set_node = doc.children.not_nil!.find { |node| node.name == "ResultSet" }.not_nil!
      return ResultSet.from_xml_node(result_set_node).not_nil!
    end
  end
end
