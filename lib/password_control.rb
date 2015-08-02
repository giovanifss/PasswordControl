# Copyright (c) 2015 Giovani Ferreira Silvério da Silva.

module PasswordControl

  require "password_control/scrypt/ScryptHash"
  require "password_control/sha/SHA256"
  require "password_control/sha/SHA384"
  require "password_control/sha/SHA512"
  require "password_control/md5/MD5"
  require "password_control/bcrypt/BcryptHash"

  class PassControl

    #Setting default value for give the possibility of them being optional at runtime.
    PARAMETERS_DEFAULT = {
      :salt => nil,
      :algorithm => nil
    }

    #Instance of selected algorithm
    attr_accessor :algorithmInstance

    #Secret is required. The rest is optional
    def initialize contents = {:secret => secret}
      #Exception for secret == null
      raise "Secret can't be null" if contents[:secret] == nil

      #Put setted and optional parameters together
      contents = PARAMETERS_DEFAULT.merge(contents)

      #Working with string. Putting in downcase to easily compare.
      contents[:algorithm] = contents[:algorithm].downcase if contents[:algorithm] != nil

      #Identify the desired algorithm. Bcrypt is the default algorithm.
      case contents[:algorithm]
      when 'scrypt'
        @algorithmInstance = ScryptHash.new contents[:secret]
      when 'sha256'
        @algorithmInstance = SHA256.new contents[:secret], contents[:salt]
      when 'sha384'
        @algorithmInstance = SHA384.new contents[:secret], contents[:salt]
      when 'sha512'
        @algorithmInstance = SHA512.new contents[:secret], contents[:salt]
      when 'md5'
        @algorithmInstance = MD5.new contents[:secret], contents[:salt]
      else
        @algorithmInstance = BcryptHash.new contents[:secret]
      end
    end

    #Compare hashes in high level
    def ==(toCompare)
      #call compare function of algorithm instance
      return @algorithmInstance == toCompare
    end
    alias_method :is_password?, :==		#multiple names

    #Return the hash produced by algorithm
    def secret
      return @algorithmInstance.hash
    end

    #Return all informations needed for future comparison.
    def prepareForSave
      return @algorithmInstance.prepareForSave
    end

  end
end
