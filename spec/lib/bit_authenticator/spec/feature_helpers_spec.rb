# frozen_string_literal: true
require 'bit_authenticator/spec/feature_helpers'

module BitAuthenticator
  module Spec
    class FeatureSpec
      def initialize(context)
        @context = context
      end

      def visit(_path)
      end

      def fill_in(_field, _options)
      end

      def find(_link)
        @context.double('element', click: nil)
      end
    end

    RSpec.describe FeatureHelpers do
      let(:user) { double('user', email: 'foo@example.com') }

      it 'visits the sign out path before the sign in path' do
        feature_spec = FeatureSpec.new(self).extend(FeatureHelpers)
        expect(feature_spec).to receive(:visit).with('/users/sign_out')
        expect(feature_spec).to receive(:visit).with('/users/sign_in')
        feature_spec.sign_in :user, user
      end
    end
  end
end
