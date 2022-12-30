Rails.application.routes.draw do
  resources :hospitals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do 
      resources :hospitals do 
        
      end
    end
  end

end
