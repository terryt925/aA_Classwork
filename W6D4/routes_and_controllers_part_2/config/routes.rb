Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:update, :show, :index, :destroy, :create]
# get 'users', to: 'users#index'#, as: 'all_users'
# get 'users/new', to: 'users#new', as: 'new_user'
# post 'users', to: 'users#create'#, as: 'create_user'

# get 'users/:id/edit', to: 'users#edit'#, as: 'edit_user'
# get 'users/:id', to: 'users#show', as: 'user'
# patch 'users/:id', to: 'users#update'
# delete 'users/:id', to: 'users#destroy'#, as: 'end_user'


end
