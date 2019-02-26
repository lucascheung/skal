Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  root to: 'pages#home'
  resources :users, only: [:index] do
    resources :swipes, only: [:create]
    post 'swiped_right', to: 'swipes#swiped_right', as: 'swiped_right'
    post 'swiped_left', to: 'swipes#swiped_left', as: 'swiped_left'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
