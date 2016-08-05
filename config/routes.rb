Rails.application.routes.draw do
  resources :members, except: [:new, :edit]
  resources :uploads, except: [:new, :edit]
  resources :competitors, except: [:new, :edit]
  resources :ideas, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  get '/sign' => 'uploads#sign'
  resources :users, only: [:index, :show]
end
