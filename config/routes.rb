CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts, only: [:show, :new, :create] do
  		resources :comments, only: [:create, :show]
  		resources :votes, only: [:create]
  end

  resources :users, only:[:create, :show, :index]
    get 'register', to: 'users#new', as: 'register'
    get 'login', to: 'sessions#new', as: 'login'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy', as: 'logout'
end
