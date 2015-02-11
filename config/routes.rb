Rails.application.routes.draw do
  
  get '/' => 'contacts#index', as: 'home'

  get '/add_contacts' => 'contacts#new'

  post '/contacts' => 'contacts#create'

  get 'contacts/:id' => 'contacts#show', as: 'contacts_id'

  # put '/contacts/:id' => 'contacts#update', as: 'update'

  post '/contacts/sort' => 'contacts#sort'

  get '/contacts/sort_letter/:letter' => 'contacts#sort_letter', as: 'letter_sort'

end
