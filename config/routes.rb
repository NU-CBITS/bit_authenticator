BitAuthenticator::Engine.routes.draw do
  if Rails.env == 'development'
    get 'quick_sign_in', to: 'quick_sign_ins#new', as: 'quick_sign_in'
  end
end
