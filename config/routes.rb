Rails.application.routes.draw do
  resources :users, only: [:create,:destroy,:index,:show,:update] do
    resources :contacts, only: [:create,:destroy,:index,:show,:update]
  end

  resources :contact_shares, only: [:create, :destroy]
end
