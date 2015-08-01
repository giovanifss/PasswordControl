## HashControl

[![Coverage Status](https://coveralls.io/repos/giovanifss/PasswordControl/badge.svg?branch=master&service=github)](https://coveralls.io/github/giovanifss/PasswordControl?branch=master)
[![Build Status](https://travis-ci.org/giovanifss/PasswordControl.svg)](https://travis-ci.org/giovanifss/PasswordControl)


A high level ruby library for password hash control.

This library support and abstract the following hash algorithm:
- Scrypt - from gem: https://rubygems.org/gems/scrypt/versions/2.0.2
- Bcrypt - from gem: https://rubygems.org/gems/bcrypt-ruby/versions/3.1.5
- SHA256
- SHA384
- SHA512
- MD5

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'password_control'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install password_control

## Usage

bcrypt is the default algorithm, if you don't select or select wrong an algorithm, bcrypt will be used.
```ruby
hashcontrol = HashControl::HashControl.new :secret => "The user password" # Optional :algorithm => "The desired algorithm"
hashcontrol = HashControl::HashControl.new :secret => "User password", :algorithm => "scrypt"
```
The HashControl will take care of the hashing process.

For save the data in database, use the prepareForSave() function:
```ruby
hashcontrol.prepareForSave()
```
This function will return all information needed for a future comparison.

For compare in the future, get the hashmap stored in database and pass as argument to HashControl:
```ruby
hashcontrol = HashControl::HashControl.new DATA_IN_DATABASE
```
And for compare the hash with the user password, simple use funcion ==
```ruby
hashcontrol == "user password"
```
As simple as it sounds!

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/giovanifss/HashControl.

1. Fork it (https://github.com/giovanifss/HashControl/fork)
2. Create your feature branch  ('git checkout -b my-feature')
3. Commit your changes ('git commit -am "add my feature"')
4. Push to the branch ('git push origin my-feature')
5. Create a Pull Request

## License
This library is under LGPL license, it means:
You may copy, distribute and modify the software provided that modifications are described and licensed for free under LGPL. Derivatives works (including modifications or anything statically linked to the library) can only be redistributed under LGPL, but applications that use the library don't have to be.

For more details see LICENSE.
