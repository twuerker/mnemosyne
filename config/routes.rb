# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#                     root GET    /                                 users#home
#                    notes POST   /notes(.:format)                  notes#create
#                 new_note GET    /notes/new(.:format)              notes#new
#                edit_note GET    /notes/:id/edit(.:format)         notes#edit
#                     note GET    /notes/:id(.:format)              notes#show
#                          PATCH  /notes/:id(.:format)              notes#update
#                          PUT    /notes/:id(.:format)              notes#update
#                home_user GET    /users/:id/home(.:format)         users#home
#             friends_user GET    /users/:id/friends(.:format)      users#friends
#        find_friends_user GET    /users/:id/find_friends(.:format) users#find_friends
#                    users GET    /users(.:format)                  users#index
#                          POST   /users(.:format)                  users#create
#                 new_user GET    /users/new(.:format)              users#new
#                edit_user GET    /users/:id/edit(.:format)         users#edit
#                     user GET    /users/:id(.:format)              users#show
#                          PATCH  /users/:id(.:format)              users#update
#                          PUT    /users/:id(.:format)              users#update
#                          DELETE /users/:id(.:format)              users#destroy
#              friendships POST   /friendships(.:format)            friendships#create
#           new_friendship GET    /friendships/new(.:format)        friendships#new
#          edit_friendship GET    /friendships/:id/edit(.:format)   friendships#edit
#               friendship GET    /friendships/:id(.:format)        friendships#show
#                          PATCH  /friendships/:id(.:format)        friendships#update
#                          PUT    /friendships/:id(.:format)        friendships#update
#                          DELETE /friendships/:id(.:format)        friendships#destroy
#

Rails.application.routes.draw do
  devise_for :users

  root :to => 'users#home'

  resources :notes, :except => [:index, :destroy]

  resources :users do
    member do
      get 'home'
      get 'friends'
      get 'find_friends'
    end
  end

  resources :friendships, :except => [:index]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
