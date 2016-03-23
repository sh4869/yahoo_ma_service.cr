require "xml"

module YahooMAService
  class Word
    getter surface, reading, pos, baseform, feature

    # :nodoc:
    def initialize(@surface : String, @reading : String, @pos : String, @baseform : String, @feature : String)
    end

    # Create a Word from XML::Node
    def self.from_xml_node(node)
      if node.name == "word"
        pos = node.children.find { |node| node.name == "pos" }.not_nil!.content.not_nil!
        surface = node.children.find { |node| node.name == "surface" }.not_nil!.content.not_nil!
        reading = node.children.find { |node| node.name == "reading" }.not_nil!.content.not_nil!
        begin
          baseform_node = node.children.find { |node| node.name == "baseform" }.not_nil!
        rescue
          baseform = ""
        else
          baseform = baseform_node.content.not_nil!
        end
        begin
          feature_node = node.children.find { |node| node.name == "feature" }.not_nil!
        rescue
          feature = ""
        else
          feature = feature_node.content.not_nil!
        end
        return self.new(surface, reading, pos, baseform.not_nil!, feature.not_nil!)
      end
    end
  end
end
