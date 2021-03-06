# frozen_string_literal: true
require 'active_support'

module BitAuthenticator
  module Spec
    # Helper methods to be included in feature specs.
    module FeatureHelpers
      # Sign out then sign in the specified resource, using the HTML form.
      # Assumes that conventional Devise routes are used.
      #
      # Examples:
      #     sign_in :user, my_user
      #     sign_in :user, my_user, 'password123'
      def sign_in(resource_type, resource, password = nil)
        plural_resource = Class.new.extend(ActiveSupport::Inflector)
                               .pluralize(resource_type)
        visit "/#{ plural_resource }/sign_out"
        visit "/#{ plural_resource }/sign_in"
        fill_in 'Email', with: resource.email
        fill_in 'Password', with: (password || 'secrets!')
        find('input[type="submit"]').click
      end
    end
  end
end
