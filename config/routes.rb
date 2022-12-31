Rails.application.routes.draw do
  root "welcome#index"
  resources :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do 
      resources :hospitals do 
        collection do 
          get :search 
        end
      end
    end
  end

end
