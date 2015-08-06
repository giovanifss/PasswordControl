describe PasswordControl do
	# Testing the algorithms
	# How the defined password is written doesn't matter - see directly set algorithms tests
	context "PasswordControl Algorithms Tests" do

		# Default algorithm = Bcrypt
		it "Default password test" do
			@passControl = PasswordController.new :secret => "A really strong password"
			expect(@passControl.prepareForSave[:algorithm]).to eql("bcrypt")
		end

		# Setting Scrypt directly
		it "Setting scrypt algorithm test" do
			@passControl = PasswordController.new :secret => "password", :algorithm => "scrypt"
			expect(@passControl.prepareForSave[:algorithm]).to eql("scrypt")
		end

		# Setting MD5 directly
		it "Setting md5 algorithm test" do
			@passControl = PasswordController.new :secret => "test", :algorithm => "mD5" # Whatever if lowercase or uppercase
			expect(@passControl.prepareForSave[:algorithm]).to eql("md5")
		end

		# Setting sha256 directly
		it "Setting sha256 algorithm test" do
			@passControl = PasswordController.new :secret => "Im running out of ideas", :algorithm => "ShA256"
			expect(@passControl.prepareForSave[:algorithm]).to eql("sha256")
		end

		# Setting sha384 directly
		it "Setting sha384 algorithm test" do
			@passControl = PasswordController.new :secret => "Give me and idea of password", :algorithm => "sHa384"
			expect(@passControl.prepareForSave[:algorithm]).to eql("sha384")
		end

		# Setting sha512 directly
		it "Setting sha512 algorithm test" do
			@passControl = PasswordController.new :secret => "Open source o/", :algorithm => "Sha512"
			expect(@passControl.prepareForSave[:algorithm]).to eql("sha512")
		end

	end
end
