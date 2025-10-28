Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # ログインフォームの表示
  get 'login', to: 'sessions#new'
  # フォーム送信（認証処理）
  post 'login', to: 'sessions#create'
  # アプリのトップページをログイン画面にする
  root 'sessions#new'
  # ログイン成功時の表示ページ（仮）
  get 'home', to: 'sessions#home'
  
  get 'login_failure', to: 'sessions#failure'
  
  get 'logout', to: 'sessions#destroy'
end
