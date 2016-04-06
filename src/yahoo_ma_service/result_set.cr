require "./uniq_result"
require "./ma_result"
require "xml"

module YahooMAService
  class ResultSet
    getter ma_result, uniq_result

    def initialize(@ma_result, @uniq_result); end

    def self.from_xml_node(xml)
      if xml.name == "ResultSet"
        begin
          ma_result = MAResult.from_xml_node(xml.children.find { |node| node.name == "ma_result" }.not_nil!)
        rescue
        end
        begin
          uniq_result = UniqResult.from_xml_node(xml.children.find { |node| node.name == "uniq_result" }.not_nil!)
        rescue
        end
        return self.new(ma_result, uniq_result)
      end
    end
  end
end
