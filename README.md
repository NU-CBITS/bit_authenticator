# BitAuthenticator

## Clone this repository

    git clone https://github.com/cbitstech/bit_authenticator

## Use feature helpers

To authenticate a resource (such as a User) in a feature spec, first include
the helpers in your `spec/spec_helper.rb` or `spec/rails_helper.rb` file:

    require 'bit_authenticator/spec/feature_helpers'

Then include the helpers for all feature specs:

    RSpec.configure do |config|
      ...
      config.include BitAuthenticator::Spec::FeatureHelpers
    end

Now use the helper methods:

    require 'rails_helper'

    describe 'my awesome feature' do
      scenario 'User logs in' do
        sign_in :user, User.first
      end
    end
