describe ScryptHash do
  # Testing the scrypt algorithm implementation
  context "Scrypt algorithm test" do

    it "Equal passwords comparison test" do
      @scrypt = ScryptHash.new "Some password"
      # The "Some password" now is a big hash
      expect(true).to eql(@scrypt == "Some password")
    end

    it "Different passwords comparison test" do
      @scrypt = ScryptHash.new "Some password"
      # The "Some password" now is a big hash
      expect(false).to eql(@scrypt == "Another password")
    end

  end
end
