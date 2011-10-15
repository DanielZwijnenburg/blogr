Rails.application.routes.draw do
  scope "blog", :module => :blogr, :as => "blogr" do
    root :to => "posts#index"
    resources :posts, :only => [:index, :show] do
      resource :comments
    end
    resources :pages, :only => [:index, :show] do
      resources :inquiries
    end
    namespace :admin do
      root :to => "sessions#new"
      get "logout" => "sessions#destroy", :as => "logout"
      get "login" => "sessions#new", :as => "login"
      get "sign_up" => "users#new", :as => "sign_up"
      resources :posts do
        get :publish, :on => :member
        resource :comments
      end
      resources :sessions do
        get :dashboard, :on => :collection
      end
      resources :pages do
        get :hide, :on => :member
        get :unhide, :on => :member
      end
      match 'pages/update_positions/', :controller=>'pages', :action => 'update_positions'
      match 'pages/update_page/', :controller=>'pages', :action => 'update_page'
      resources :categories, :users, :sessions
      resources :medias do
        get :overview, :on => :collection
      end
    end
  end
end