require "./spec_helper.cr"
require "xml"

describe YahooMAService::MAResult do
	it "#initialize" do			
		word1 = YahooMAService::Word.new("雨","あめ","名詞","","").not_nil!
		word2 = YahooMAService::Word.new("bot","ぼっと","名詞","","").not_nil!
		words = [word1,word2]
		ma_result = YahooMAService::MAResult.new(2,2,words).not_nil!
		ma_result.total_count.should eq(2)
		ma_result.filtered_count.should eq(2)
		ma_result.word_list.should eq(words)
	end

	it "#from_xml_node" do
		#TODO Write Test	
	end
end
