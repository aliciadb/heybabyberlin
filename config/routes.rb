Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'profiles/edit', to: 'profiles#edit', as: :edit_profile
  patch 'profiles', to: 'profiles#update'
  get 'profiles', to: 'profiles#show', as: :profile
  get 'tasks', to: 'tasks#index', as: :tasks
  resources :pregnancies, only: [:new, :create]
  resources :important_contacts, only: [:new, :create]
  resources :categories, only: [:index, :show] do
    resources :tasks, only: [:show, :update]
  end

  resources :documents, only: [:index]
  get 'categories/:category_id/documents', to: 'documents#show', as: :document

  # Defines the root path route ("/")
  # root "articles#index"
end
