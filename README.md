# BitAuthenticator

## Install in a Rails application

Add it to the Gemfile:

```ruby
gem 'bit_authenticator',
    git: 'https://github.com/cbitstech/bit_authenticator.git'
```

install it:

    bundle install

## Use RSpec helpers

### Feature spec helpers

To authenticate a resource (in this example a User) in a feature spec, first
include the helpers in your `spec/spec_helper.rb` or `spec/rails_helper.rb`
file:

```ruby
require 'bit_authenticator/spec/feature_helpers'
```

Then include the helpers in all feature specs:

```ruby
RSpec.configure do |config|
  ...
  config.include BitAuthenticator::Spec::FeatureHelpers, type: :feature
end
```

Now use the helper methods in feature specs:

```ruby
require 'rails_helper'

describe 'my awesome feature' do
  scenario 'User accesses the awesome feature' do
    sign_in :user, User.first
    ...
  end
end
```

### Controller spec helpers

To authenticate a resource (in this example a Person) in a controller spec,
first include the helpers in your `spec/spec_helper.rb` or
`spec/rails_helper.rb` file:

```ruby
require 'bit_authenticator/spec/controller_helpers'
```

Then include both the Devise and BitAuthenticator helpers in all controller
specs:

```ruby
RSpec.configure do |config|
  ...
  config.include Devise::TestHelpers, type: :controller
  config.include BitAuthenticator::Spec::ControllerHelpers, type: :controller
end
```

Now use the helper methods in controller specs:

```ruby
require 'rails_helper'

describe MyController, type: :controller do
  it 'should be pretty sweet' do
    sign_in :person, Person.first
    ...
  end
end
```

## Use quick sign in helper in development

First mount the engine routes in `config/routes.rb`:

```ruby
if Rails.env == 'development'
  mount BitAuthenticator::Engine, at: 'bit_authenticator'
end
```

Sign in a resource (in this example a User) by requesting:

    http://my.example-application/bit_authenticator/quick_sign_in?resource_type=user&user_id=123

## Development

### Clone this repository

    git clone https://github.com/cbitstech/bit_authenticator.git
