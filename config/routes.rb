Rails.application.routes.draw do
  # 静的ページの設定
  get 'help', to: 'static_pages#help'
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  get 'inquiries/new'
  resources :top

  # トップページ設定
  get "/" => "top#index"

  # lessonsのパス設定
  get "lessons", to: 'lessons#show', as: :lessons
  get "lessons/network-01/reference", to: 'lessons/network01#index'
  get "lessons/network-02/reference", to: 'lessons/network02#index'
  get "lessons/network-03/reference", to: 'lessons/network03#index'
  get "lessons/network-01/exam", to: 'lessons/network01#show'
  get "lessons/network-02/exam", to: 'lessons/network02#show'
  get "lessons/network-03/exam", to: 'lessons/network03#show'

  resources :lessons do
    resources :cisco ,module:'lessons'
  end

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
