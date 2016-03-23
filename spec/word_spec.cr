require "./spec_helper.cr"

describe YahooMAService::Word do
	it "#initialize" do
		word1 = YahooMAService::Word.new("雨","あめ","名詞","","").not_nil!
		word1.surface.should eq("雨")
		word1.reading.should eq("あめ")
		word1.pos.should eq("名詞")
  end
	
  it "#from_xml_node" do
		#TODO Write Test
	end

end

