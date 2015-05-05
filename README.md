# Markdownplus::Sql

SQL plugin for [Markdownplus](https://github.com/cpetersen/markdownplus)

## Installation

Add this line to your application's Gemfile:

    gem 'markdownplus-sql'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install markdownplus-sql

## Usage

```
  ```sql('postgres://username:password@ec2-12-345-678-9.compute-1.amazonaws.com:1234/database'),set('my_data_variable_name'),csv2html()
  select  name, 
          email, 
          bio, 
          twitter_handle 
  from    users 
  limit   25
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
