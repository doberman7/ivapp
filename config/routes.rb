
Rails.application.routes.draw do
  get  '/captivate',    to: 'static_pages#captivate', as: 'captivate'
  

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help', as: 'help'
  get  '/about',   to: 'static_pages#about', as: 'about'
  get  '/contact', to: 'static_pages#contact', as: 'contact'

  get  '/signup', to: 'users#new', as: 'signup' #signup_path

  post '/signup',  to: 'users#create'

  post '/login', to: 'sessions#create'#, as: 'new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
