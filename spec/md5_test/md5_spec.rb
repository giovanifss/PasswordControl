describe MD5 do
  # Testing the md5 algorithm implementation
  context "MD5 algorithm test" do
    
    it "Equal passwords comparison test" do
      @md5 = MD5.new "Send me a feedback :P"
      # The "Some password" now is a hash
      expect(true).to eql(@md5 == "Send me a feedback :P")
    end

    it "Different passwords comparison test" do
      @md5 = MD5.new "Some password"
      # The "Some password" now is a hash
      expect(false).to eql(@md5 == "Another password")
    end

  end
end
