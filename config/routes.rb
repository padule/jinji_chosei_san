JinjiChoseiSan::Application.routes.draw do

  root to: 'events#new'

  match 'events/forgote',:via => [:get,:post]

  resources :events, only: [:new, :create], param: :access_token, shallow: true do
    resources :members, only: [:new, :create, :show], param: :access_token
  end
  get 'events/:access_token/admin/:admin_token' => 'events#admin'

end
