describe SHA384 do
  # Testing the SHA384 algorithm implementation
  context "SHA384 algorithm test" do

    it "Equal passwords comparison test" do
      @sha = SHA384.new "Some password"
      # The "Some password" now is a big hash
      expect(true).to eql(@sha == "Some password")
    end

    it "Different passwords comparison test" do
      @sha = SHA384.new "Some password"
      # The "Some password" now is a big hash
      expect(false).to eql(@sha == "Another password")
    end

  end
end
