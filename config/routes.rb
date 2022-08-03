Rails.application.routes.draw do
  get 'home/index'
  devise_for :employees, controllers: {
    registrations: 'employees/registrations'
  }

  devise_for :admins
  root to: "home#index"
  resources :details
  resources :qualifications
  resources :salaries
  resources :leaves

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
