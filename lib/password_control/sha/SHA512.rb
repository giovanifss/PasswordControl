# Copyright (c) 2015 Giovani Ferreira Silvério da Silva.

# SHA512 Implementation
require 'openssl'

class SHA512

	attr_accessor :hash, :salt

	# Constructor receive a required text and an optional salt
	def initialize text, salt = nil
		# Generate a new salt if salt is nil
		@salt = salt ||= generateSalt

		# If the given text isn't a sha512 valid hash, a new one is generated
		isValidHash?(text) ? @hash = text : @hash = Digest::SHA512.hexdigest(@salt + text)
	end

	# Compare a given text to a sha384 hash
	def ==(toCompare)
		return Digest::SHA512.hexdigest(@salt + toCompare) == @hash
	end

	# Return all informations needed from hash
	def prepareForSave
		return {:algorithm => "sha512", :secret => @hash, :salt => @salt}
	end

	# Private functions
	private

	# Generate a new salt
	def generateSalt
		# Return a randonly 32 bit sequence
		return OpenSSL::Random.random_bytes(32).unpack('H*').first.rjust(16,'0')
	end

	# Check if a giver hash is a valid sha512 hash
	def isValidHash? hash
		return hash.match("[a-fA-F0-9]{40}") != nil
	end

end
