Rails.application.routes.draw do
  root 'dashboard#show'

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#delete', as: :logout

  get 'register' => 'users#new', as: :registration
  post 'register' => 'users#create'

  get 'users/:username' => 'users#show', as: :user

  get 'articles' => 'articles#index', as: :articles
  get 'articles/new' => 'articles#new', as: :new_article
  post 'articles' => 'articles#create'
  get 'articles/:id' => 'articles#show', as: :article
  get 'articles/:id/edit' => 'articles#edit', as: :edit_article
  patch 'articles/:id' => 'articles#update'
  delete 'articles/:id' => 'articles#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
