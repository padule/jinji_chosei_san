JinjiChoseiSan::Application.routes.draw do
  root to: 'events#new'

  resources :events, only: [:new, :create, :show], param: :access_token
end
