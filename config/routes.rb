Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/destroy'
  get 'profile/show'
  get 'profile/edit'

  get 'assignments/list'
  get 'assignments/show'
  get 'assignments/new'
  post 'assignments/create'
  get 'assignments/edit'
  get 'assignments/update'
  get 'assignments/delete'

  get 'courses/list'
  get 'courses/show'
  get 'courses/new'
  post 'courses/create'
  get 'courses/edit'
  get 'courses/update'
  get 'courses/delete'

  get 'home/index'
  root 'home#index'

  resources :courses
  resources :assignments
  resources :users

  get '/login',to: 'sessions#new'
  get '/logout',to: 'sessions#destroy'
  post '/login',to: 'sessions#create'
  get '/list_for_course/:id', to:'assignments#list_for_course'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
