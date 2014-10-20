module BitAuthenticator
  # Used ONLY in development to speed up manual logins.
  class QuickSignInsController < ApplicationController
    def new
      resource_class = params[:resource_type].classify.constantize
      id = params[:"#{ params[:resource_type] }_id"]
      resource = resource_class.where(id: id).first
      return if resource.nil?

      sign_in_and_redirect resource
    end
  end
end
