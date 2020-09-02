Rails.application.routes.draw do
	devise_for :users
	root 'home#top'
  	get 'home/about'

  	resources :users, only: [:show, :index, :edit, :update]
    get 'users/:id/follower' => 'users#follower', as: "follower"
    get 'users/:id/followed' => 'users#followed', as: "followed"
  	post 'follow/:id' => 'relationships#follow', as: "follow"
  	post 'unfollow/:id' => 'relationships#unfollow', as: "unfollow"

  	resources :books, except: [:new] do
  		resources :book_comments, only: [:create, :destroy]
  		resource :favorites, only: [:create, :destroy]
  	end
end