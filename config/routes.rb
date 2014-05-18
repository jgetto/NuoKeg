Nuokeg::Application.routes.draw do

  get "taps/tap"

  get "taps/finish"
  
  match 'beers/search' => 'beers#search', :via => :get
  match 'beers/instant' => 'beers#instant', :via => :get
  match 'kegs/current' => 'kegs#current', :via => :get
  match 'kegs/:id/tap' => 'kegs#tap', :as => 'keg_tap', :via => :post
  match 'kegs/:id/finish' => 'kegs#finish', :as => 'keg_finish', :via => :post
  resources :beers, :kegs
  resources :taps, only: [:index, :show]

  root :to => 'kegs#current'

end
