CourseProject::Application.routes.draw do
  root to: "main#index"
  resources :posts
  resources :commments
end
