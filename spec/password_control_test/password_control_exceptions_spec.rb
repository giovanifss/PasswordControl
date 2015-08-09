describe PasswordControl do
	# Testing the initialize limitations
	context "PasswordControl limitations test" do
		# Without arguments
		it "No arguments" do
			expect{raise "boom"}.to raise_error(RuntimeError) 
		end

		# Init with string
		it "String in initialize" do
			expect{PasswordController.new "String"}.to raise_error(RuntimeError)
		end

		# Init with numbers
		it "Number in initialize" do
			expect{PasswordController.new 23424}.to raise_error(RuntimeError)
		end

		# Init with symbol
		it "Symbol in initialize" do
			expect{PasswordController.new :secret}.to raise_error(RuntimeError)
		end

	end
end
