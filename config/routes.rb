require "api_constraints"
  Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'pages#home'

    namespace :api, defaults: { format: 'json' } do
      # namespace :v1 do
      #   get "dashing" => "pages#dashing"

      scope module: :v1, constraints: ApiConstraints.new(version: 1) do

        scope 'users', module: 'users' do
          resources :landslides
          # resources :pictures
          # resources :registrations
          # patch '/:id' => 'registrations#update', as: :update_api_seller
        end
        # devise_for :users, :controllers => { sessions: 'api/v1/users/sessions' }
      end
    end
  end

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }
  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :landslides
      end
    end
  end
end
