require "./spec_helper.cr"

describe YahooMAService::UniqWord do
	it "#initialize" do
		word1 = YahooMAService::UniqWord.new("雨","あめ","名詞","","",1).not_nil!
		word1.surface.should eq("雨")
		word1.reading.should eq("あめ")
		word1.pos.should eq("名詞")
		word1.count.should eq(1)
  end
	
  it "#from_xml_node" do
		#TODO Write Test
	end

end

