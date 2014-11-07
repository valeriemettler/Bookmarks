Bookmarks::Application.routes.draw do
 
  devise_for :users

  resources :topics
  resources :bookmarks do
   resources :likes, only: [:create, :destroy]
  end
  
  resources :user_bookmarks

  get "welcome/index"
  get "welcome/about"
  root to: 'welcome#index'  
  post :incoming, to: 'incoming#create'
  
end
