require "xml"
require "./word"

module YahooMAService
  class MAResult
    getter total_count, filtered_count, word_list

    # :nodoc:
    def initialize(@total_count : Int, @filtered_count : Int, @word_list : Array(Word))
    end

    def self.from_xml_node(xml)
      if xml.name == "ma_result"
        total_count = xml.children.find { |node| node.name == "total_count" }.not_nil!.content.not_nil!.to_i
        filtered_count = xml.children.find { |node| node.name == "filtered_count" }.not_nil!.content.not_nil!.to_i
        word_list_node = xml.children.find { |node| node.name == "word_list" }.not_nil!
        word_list = [] of Word
        word_list_node.children.each do |word|
          word_list << Word.from_xml_node(word).not_nil!
        end
        return self.new(total_count, filtered_count, word_list)
      end
    end
  end
end
