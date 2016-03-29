require "./spec_helper.cr"
require "xml"

describe YahooMAService::UniqResult do
	it "#initialize" do			
		word1 = YahooMAService::UniqWord.new("雨","あめ","名詞","","",1).not_nil!
		word2 = YahooMAService::UniqWord.new("bot","ぼっと","名詞","","",1).not_nil!
		words = [word1,word2]
		ma_result = YahooMAService::UniqResult.new(2,2,words).not_nil!
		ma_result.total_count.should eq(2)
		ma_result.filtered_count.should eq(2)
		ma_result.word_list.should eq(words)
	end

	it "#from_xml_node" do
		#TODO Write Test	
	end
end
