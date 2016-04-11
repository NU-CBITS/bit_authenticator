# frozen_string_literal: true
module BitAuthenticator
  module Spec
    # Helper methods to be included in controller specs.
    module ControllerHelpers
      # Stub the authentication mechanism
      def sign_in(type, resource)
        stub_authenticate! type, resource
        stub_devise_methods type, resource
      end

      private

      def stub_authenticate!(type, resource)
        if resource.nil?
          allow(request.env['warden']).to receive(:authenticate!)
            .and_throw(:warden, scope: :"#{ type }")
        else
          allow(request.env['warden']).to receive(:authenticate!) { resource }
        end
      end

      def stub_devise_methods(type, resource)
        allow(controller).to receive("current_#{ type }") { resource }
        allow(controller).to receive("#{ type }_signed_in?") { true }
      end
    end
  end
end
