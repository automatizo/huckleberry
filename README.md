**Important Notice: This gem is still under active development and not yet
functional.**

[![Code
Climate](https://codeclimate.com/github/automatizo/huckleberry/badges/gpa.svg)](https://codeclimate.com/github/automatizo/huckleberry)

# Huckleberry

Huckleberry imports a curated version of the USDA's nutritional datasets for use
in nutrition apps. While the USDA's datasets are great for research purposes,
we've reorganized, recalculated, and developed methods to enable easy access to
the most useful data for developers of nutrition apps, such as meal planners,
recipe aggregators, and other applications.

Thank you to Matt Beedle and his [USDA Nutrient
Database](https://github.com/mattbeedle/usda-nutrient-database) for a lot of the
code underlying this project and to the USDA for providing free data!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'huckleberry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install huckleberry

Install the necessary migrations by running:

    $ rake huckleberry_engine:install:migrations

## Usage

Import nutritional data using the import task:

    $ rake huckleberry:import

Note: The USDA's datasets contain hundreds of thousands of records, which means
that this process may take some time.

The data can then be accessed in an ingredients model:

    Huckleberry::Ingredient
    Huckleberry::Ingredient.calories
    Huckleberry::Ingredient.fats
    Huckleberry::Ingredient.carbohydrates
    Huckleberry::Ingredients.proteins
    Huckleberry::Ingredients.sterols
    Huckleberry::Ingredients.vitamins
    Huckleberry::Ingredients.minerals

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/automatizo/huckleberry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

