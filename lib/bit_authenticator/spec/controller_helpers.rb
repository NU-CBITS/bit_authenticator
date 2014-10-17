module BitAuthenticator
  module Spec
    # Helper methods to be included in controller specs.
    module ControllerHelpers
      # Stub the authentication mechanism
      def sign_in(type, resource)
        if resource.nil?
          expect(request.env['warden']).to receive(:authenticate!)
            .and_throw(:warden, scope: :"#{ type }")
          controller.stub :"current_#{ type }" => nil
        else
          expect(request.env['warden']).to receive(:authenticate!) { resource }
          allow(controller).to receive("current_#{ type }") { resource }
        end
      end
    end
  end
end
