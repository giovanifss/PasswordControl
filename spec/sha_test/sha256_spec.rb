describe SHA256 do
  # Testing the SHA256 algorithm implementation
  context "SHA256 algorithm test" do

    it "Equal passwords comparison test" do
      @sha = SHA256.new "Some password"
      # The "Some password" now is a big hash
      expect(true).to eql(@sha == "Some password")
    end

    it "Different passwords comparison test" do
      @sha = SHA256.new "Some password"
      # The "Some password" now is a big hash
      expect(false).to eql(@sha == "Another password")
    end

  end
end
