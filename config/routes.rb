Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :show]

  resources :instructors do 
    resources :students, shallow: true
  end

end
