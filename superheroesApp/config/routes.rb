Rails.application.routes.draw do
  get '/home', to: 'sessions#home'

  get '/signup', to: 'sessions#signup'
 	post '/signup' => 'sessions#create'
  get '/login' => 'sessions#login'
  post 'login' => 'sessions#attempt_login'

  delete '/logout', to: "sessions#logout", as: "logout"

  root 'teams#index'
  resources :users do
    resources :teams, shallow: true
  end
  resources :superheroes
end

# # Prefix Verb   URI Pattern                         Controller#Action
#         Prefix Verb   URI Pattern                         Controller#Action
#           home GET    /home(.:format)                     sessions#home
#         signup GET    /signup(.:format)                   sessions#signup
#                POST   /signup(.:format)                   sessions#create
#          login GET    /login(.:format)                    sessions#login
#                POST   /login(.:format)                    sessions#attempt_login
#         logout DELETE /logout(.:format)                   sessions#logout
#           root GET    /                                   teams#index
#     user_teams GET    /users/:user_id/teams(.:format)     teams#index
#                POST   /users/:user_id/teams(.:format)     teams#create
#  new_user_team GET    /users/:user_id/teams/new(.:format) teams#new
#      edit_team GET    /teams/:id/edit(.:format)           teams#edit
#           team GET    /teams/:id(.:format)                teams#show
#                PATCH  /teams/:id(.:format)                teams#update
#                PUT    /teams/:id(.:format)                teams#update
#                DELETE /teams/:id(.:format)                teams#destroy
#          users GET    /users(.:format)                    users#index
#                POST   /users(.:format)                    users#create
#       new_user GET    /users/new(.:format)                users#new
#      edit_user GET    /users/:id/edit(.:format)           users#edit
#           user GET    /users/:id(.:format)                users#show
#                PATCH  /users/:id(.:format)                users#update
#                PUT    /users/:id(.:format)                users#update
#                DELETE /users/:id(.:format)                users#destroy
#    superheroes GET    /superheroes(.:format)              superheroes#index
#                POST   /superheroes(.:format)              superheroes#create
#  new_superhero GET    /superheroes/new(.:format)          superheroes#new
# edit_superhero GET    /superheroes/:id/edit(.:format)     superheroes#edit
#      superhero GET    /superheroes/:id(.:format)          superheroes#show
#                PATCH  /superheroes/:id(.:format)          superheroes#update
#                PUT    /superheroes/:id(.:format)          superheroes#update
#                DELETE /superheroes/:id(.:format)          superheroes#destroy