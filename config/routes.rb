Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  get 'about', to: 'articles#about'
  # get 'contact', to: 'articles#contact'
  get 'portfolio', to: 'articles#portfolio'
  get 'policy', to: 'articles#policy'

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to:'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
end
