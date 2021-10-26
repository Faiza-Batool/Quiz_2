Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # RESTful routes
  get('/', {to: 'ideas#index', as: 'root'})
  # get('/ideas/new',{to: 'ideas#new'})
  # get('/ideas/:id',{to: 'ideas#show', as: :idea })
  # delete('/ideas/:id',{to: 'ideas#destroy'})
  # idea('/ideas/',{to: 'ideas#create'})
  # get('/ideas/:id/edit',{to: 'ideas#edit', as: :edit_idea})
  # patch('/ideas/:id', {to: 'ideas#update'})

  resources :ideas do
    resources :reviews, only:[:create, :destroy]
    
    resources :likes, shallow: true, only:[:create, :destroy]
    get :liked, on: :collection
  end

  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]

end
