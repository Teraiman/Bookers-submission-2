Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'top' => 'homes'
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'

end
