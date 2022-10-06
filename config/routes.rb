Rails.application.routes.draw do
   devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
   devise_for :customers,skip: [:passwords],controllers: {
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }
  namespace :admin do
    root to:"homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :edit, :show, :update, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order, only: [ :update]
    get 'orders/confirm'=> 'order#show'
    resources :order_details, only: [:update]
  end
  namespace :public do
    get '/home/about'=>'homes#about',as: "about"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :confirm, :complete, :create]
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/my_page' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
  end
    root to:'public/homes#top'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end