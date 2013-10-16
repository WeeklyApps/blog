Blog::Application.routes.draw do
  
  # Changed from:
  # devise_for :users
  # to disable user registration but still allow editing and updating.
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  resources :projects do
    resources :comments
  end

  resources :announcements do
    resources :comments
  end

  root 'posts#index'
  resources :posts do
    resources :comments
    collection do
      get 'by_month'
    end
  end
  
  get '/feed' => 'posts#feed',
        :as => :feed,
        :defaults => { :format => 'atom' }
  
  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'users/:user_id', to: 'posts#index', as: :user
end
