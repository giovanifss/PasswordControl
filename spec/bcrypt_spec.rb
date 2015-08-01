describe BcryptHash do
  # Testing the bcrypt algorithm implementation
  context "Bcrypt algorithm test" do
    # Comparing hash with user entry test
    it "Equal passwords comparison test" do
      @bcrypt = BcryptHash.new "Some password"
      # The "Some password" now is a big hash
      expect(true).to eql(@bcrypt == "Some password")
    end

    it "Different passwords comparison test" do
      @bcrypt = BcryptHash.new "Some password"
      # The "Some password" now is a big hash
      expect(false).to eql(@bcrypt == "Another password")
    end

  end
end
