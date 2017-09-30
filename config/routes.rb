Rails.application.routes.draw do
  devise_for :users
  resources :articles do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users
  get '/users/:id/drafts' => 'users#drafts'
  root 'articles#index'
end
