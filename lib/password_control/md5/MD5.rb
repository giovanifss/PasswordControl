# Copyright (c) 2015 Giovani Ferreira Silvério da Silva.

# MD5 implementation - only recommended for integrity stuffs - and maybe hahahaha
# MD5 is now an outdated algorithm
require 'openssl'

class MD5

	attr_accessor :hash, :salt

	# Text is required, salt is optional
	def initialize text, salt = nil
		# Generate a new salt if salt is nil
		@salt = salt ||= generateSalt

		# If the given text isn't a valid hash, a new one is generated
		isValidHash?(text) ? @hash = text : @hash = Digest::MD5.hexdigest(@salt + text)
	end

	# Compare a given text (after hashing) with the hash
	def ==(toCompare)
		return Digest::MD5.hexdigest(@salt + toCompare) == @hash
	end

	# Return all informations needed from hash
	def prepareForSave
		return {:algorithm => "md5", :secret => @hash, :salt => @salt}
	end

	# Private functions
	private

	# Generate a new Salt
	def generateSalt
		# Return a aleatory 32 bytes sequence
		return OpenSSL::Random.random_bytes(32).unpack('H*').first.rjust(16,'0')
	end

	# Check if a given text is a valid MD5 hash
	def isValidHash? hash
		return hash.match("[a-fA-F0-9]{32}") != nil
	end

end
