Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '*all' => 'options_request#response_preflight_request', via: :options

	namespace :api, {format: 'json'} do
		namespace :v1 do
			resources :rankings, only: [:index, :create]
			resources :cards, only: [:index]
		end
	end

  root to: 'home#index'
end
