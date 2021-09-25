Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # 静的ページの設定
  get "help", to: "static_pages#help"
  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"

  # トップページ設定
  get "/", to: "top#index", as: "top"
  get "references/networks", to: "references#networks"
  get "references/jsons", to: "references#jsons"
  
  # lessonsのパス設定
  get "lessons", to: "lessons#index", as: "lesson_index_path"
  resources :lessons, only: [:show]
  post "lessons/check", to: "lessons#check"

  # inquiriesのパス設定
  resources :inquiries, only: [:new, :create]

  # usersのパス設定
  get "users/:id/edit", to: "users#edit", as: :edit_user_get
  patch "users/:id", to: "users#update", as: :edit_user_patch
  put "users/:id", to: "users#update", as: :edit_user_put
  get "users/account/:id", to: "users#show", as: :show_users

  # deviseの設定
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

end
