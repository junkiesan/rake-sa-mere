# Rake sa mère
### A simple tutorial to create clean and simple tests for rails projects

## Stack

```
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simple-cov'
end
```

## Best Practices

### Describe

Be clear, the idea is to describe the model and the action tested.

```
describe Cat, '#meow?' do
```

### Context

```
context '#initialize' do
    it { expect(subject).to be_valid }
end
```

### Shortness

Write short descriptive sentences

```
describe 'validations' do
  context 'it validates name' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
```

### Subject

Use the subject keyword to shorten your specs.

```
  subject { described_class.new(name: "Junkiesan") }
```


If you want more advices on how to write great specs, [BetterSpecs](https://www.betterspecs.org/) is here for you !

## Factory Bot

A gem that allow to populate your tests with data.

```
FactoryBot.define do
  factory :model do
    name { Faker::Name.name }
    age { rand(0...15) }
    user_id { User.sample.id }
  end
end
```

If you want to learn more about Factory Bot use this [cheatsheet](https://devhints.io/factory_bot)

## Simple Cov

A gem that help to check your specs as they grow.

in *rails_helper.rb*
```
require 'simplecov'
SimpleCov.start
```

## Github Actions

Github permit to use Actions to work with Continuous Integration (CI).

On root create a folder named .Github and inside an other folder named Workflow.
Inside this last folder create a file my_first_CI.yml
You need to write the script Github Action will run after you push.
Basicaly, you describe what you want to test and you want to run it.

- name: put the name of your Github Action
- on: frequency of running it (ex: pull_request, push)
- jobs: an action to run divided in options and steps

To create a job you need :
```
job-goal:
  name: Goal
  services:
    db-service-you-are-using
  steps:
    - uses: to check versions
    - name: step name
      run: the shell script doing the step
```
If you need a specific environment you can and an env: variable to each step or job.

For a [setup tutorial](https://www.pibit.nl/github/actions/rails/postgres/rspec/tutorial/example/2019/09/23/github-actions-with-rails-postgres-and-rspec/)

## Installation

For it's first launch run the following command :

```
bundle install
```

Create the db

```
rails db:create
```
Then run the migrations

```
rails db:migrate
```

## Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
