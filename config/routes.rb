Pygments::Application.routes.draw do
  resources :users
  root to: 'home', action: 'index'
end
