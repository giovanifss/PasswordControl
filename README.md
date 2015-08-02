# HashControl

[![Coverage Status](https://coveralls.io/repos/giovanifss/PasswordControl/badge.svg?branch=master&service=github)](https://coveralls.io/github/giovanifss/PasswordControl?branch=master)
[![Build Status](https://travis-ci.org/giovanifss/PasswordControl.svg)](https://travis-ci.org/giovanifss/PasswordControl)

A high level ruby library for control hash algorithms. Designed to make possible to everybody secure the passwords of your clients with any knowledge about security.

## Algorithms supported

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

#### Hashing a password:

This library was structured for simplicity. To Hash a password with a strong algorithm (bcrypt), you just need to:
```ruby
passControl = PasswordControl::PassControl.new :secret => "The user password"
```

#### Setting the desired hash algorithm for the library:

This library supports some algorithms (see algorithms supported section). You can specify the algorithm for use at the time of instantiation:

```ruby
 # algorithms: sha256, sha384, sha512, scrypt, bcrypt
passControl = PasswordControl::PassControl.new :secret => "User password", :algorithm => "Your option"
```

For example, let's set scrypt as our algorithm:

```ruby
passControl = PasswordControl::PassControl.new :secret => "User password", :algorithm => "scrypt"
```
Now the library will use the scrypt algorithm to hash this secret.

#### Saving data:

The library need some informations of the hash process to comparisons in the future. To store this informations in database, you will need to call prepareForSave() method:
```ruby
passControl.prepareForSave()
```

This method will return all the informations needed for library in a HashMap style. For example:
```ruby
{:secret => "$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy", :algorithm => "bcrypt"}
```

Some other algorithms may return the generate salt together.

#### Restoring from database:

For compare in the future, get the HashMap stored in database and pass as argument to PassControl:
```ruby
passControl = PasswordControl::PassControl.new HashMap_IN_DATABASE

passControl = PasswordControl::PassControl.new {:secret => "$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy", :algorithm => "bcrypt"}
```

#### Comparison:

And for compare the hash with the user password, simple use funcion ==
```ruby
passControl == "user password"
```

As simple as it sounds!

#### Salt:

The password_control gem will take care of strong salt generation for each hashing process.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/giovanifss/PasswordControl.

1. Fork it (https://github.com/giovanifss/HashControl/fork)
2. Create your feature branch  ('git checkout -b my-feature')
3. Commit your changes ('git commit -am "add my feature"')
4. Push to the branch ('git push origin my-feature')
5. Create a Pull Request

## License
This library is under LGPL license, it means:
You may copy, distribute and modify the software provided that modifications are described and licensed for free under LGPL. Derivatives works (including modifications or anything statically linked to the library) can only be redistributed under LGPL, but applications that use the library don't have to be.

For more details see LICENSE.
