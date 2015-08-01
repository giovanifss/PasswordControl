# Copyright (c) 2015 Giovani Ferreira Silvério da Silva.

# Bcrypt implementation
# Using 'bcrypt' gem for algorithm
require 'bcrypt'

class BcryptHash

	# hash produced by the gem
	attr_accessor :hash

	# Can be initialized with a password or hash
	def initialize password
		# Check if the entry is a valid bcrypt hash
		begin
			aux = BCrypt::Password.new(password)
			@hash = aux
		rescue
			# In the case of it fails, a new bcrypt hash is created
			@hash = BCrypt::Password.create(password)
		end
	end

	# Check if the entry (will be hashed) is equal to hash
	def ==(toCompare)
		return @hash == toCompare
	end
	alias_method :is_password?, :==		# Multiple names for this method

	# Return all informations needed from hash
	def prepareForSave
		return {:algorithm => "bcrypt", :secret => @hash}
	end

end
