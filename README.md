# Rake sa mère
### A simple tutorial to create clean and simple tests for

## Stack

- Rspec

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
