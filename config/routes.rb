Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # 静的ページの設定
  get 'help', to: 'static_pages#help'
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  get 'inquiries/new'
  resources :top
  resources :lessons, only: [:show, :update, :new, :create]
  
  # トップページ設定
  get "/" => "top#index"

  # lessonsのパス設定
  get "lessons", to: 'lessons#index'
  get "lessons/batch/reference", to: 'lessons/batchs#index'
  get "lessons/network/reference", to: 'lessons/networks#index'
  get "lessons/json/reference", to: 'lessons/jsons#index'
  get "lessons/batch/exam", to: 'lessons/batchs#show'
  get "lessons/network/exam", to: 'lessons/networks#show'
  get "lessons/json/exam", to: 'lessons/jsons#show'


  # inquiriesのパス設定
  get "inquiries/new", to: 'inquiries#new', as: :new_inquiries
  # usersのパス設定
  get "users", to: 'users#index'
  patch "users" => 'users#update'
  get "users/account", to: 'users#show', as: :show_users

  # deviseの設定
  devise_for :users, :controllers => {
    :registrations => 'registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "users/sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy" 
  end
end
