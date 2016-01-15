Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login', to: 'sessions#new', as: 'login'

  resources :users do
    resources :monsters do
    	member do
    		post :add_monster_in_team
    	end
    end
    resources :teams
  end
 root to: 'monsters#index' 
end
