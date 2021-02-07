Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :applications, param: :token do
       resources :chats, param: :number do
            resources :messages, only: [:create, :index]
       end
    end

end
