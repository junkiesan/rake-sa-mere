# Rake sa mère
### A simple tutorial to create clean and simple tests for

## Stack

- Rspec

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
context 'when sleeping' do
  it { is_expected.to respond_with false }
end
```

### Factory Bot

A gem that allow to populate your tests with data.


### Github Actions

Github permit to use Actions to work with Continuous Integration (CI).

On root create a folder named .Github and inside an other folder named Workflow.
Inside this last folder create a file my_first_CI.yml
You need to write the script Github Action will run after you push.

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
