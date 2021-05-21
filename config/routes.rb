Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students do 
    resources :lessons
  end
  resources :instructors
  get '/', to: "application#home", as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:anything', to: "application#wrong_page"
  match '/auth/:provider/callback' => 'sessions#google', via: [:get,:post]
end