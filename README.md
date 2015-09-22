[![Code
Climate](https://codeclimate.com/github/automatizo/huckleberry/badges/gpa.svg)](https://codeclimate.com/github/automatizo/huckleberry) [![Build
Status](https://travis-ci.org/automatizo/huckleberry.svg?branch=master)](https://travis-ci.org/automatizo/huckleberry)

# Huckleberry

Huckleberry imports a curated version of the USDA's nutritional datasets for use
in nutrition apps. While the USDA's datasets are great for research purposes,
we've reorganized, recalculated, and developed methods to enable easy access to
the most useful data for developers of nutrition apps, such as meal planners,
recipe aggregators, and other applications.

Thank you to Matt Beedle and his [USDA Nutrient
Database](https://github.com/mattbeedle/usda-nutrient-database) for some of the
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

And then migrate the database:

    $ rake db:migrate

## Usage

Import nutritional data using the import task:

    $ rake huckleberry:import

Note: The USDA's datasets contain hundreds of thousands of records, which means
that this process may take some time.

The data can then be accessed in an ingredients model, for example:

    Huckleberry::Ingredient
    Huckleberry::Ingredient.total_calories
    Huckleberry::Ingredient.saturated_fat
    Huckleberry::Ingredient.fructose
    Huckleberry::Ingredients.selenium

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/automatizo/huckleberry. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

