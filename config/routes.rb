Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  root to: 'pages#home'
  get 'settings', to: 'pages#settings', as: 'settings'
  post 'change_preference', to: 'users#change_preference', as: 'change_preference'
  resources :users, only: [:index, :show] do
    get 'check_match', to: 'users#check_match', as: 'check_match'
    resources :swipes, only: [:create]
    post 'swiped_right', to: 'swipes#swiped_right', as: 'swiped_right'
    post 'swiped_left', to: 'swipes#swiped_left', as: 'swiped_left'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
