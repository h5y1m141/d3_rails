Rails.application.routes.draw do
  resources :technical_words do
    collection do
      post :relation_words      
    end
  end
end
