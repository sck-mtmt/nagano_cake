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
  end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
