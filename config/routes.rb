Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    # book
    get 'book/list' => 'book#index'
    get 'book/search' => 'book#search'
    get 'book/:id' => 'book#show'
    post 'book/new' => 'book#create'
    post 'book/edit' => 'book#update'
    post 'book/delete' => 'book#destroy'

    # master
    # category
    get 'master/category' => 'master#allcategory'

    # format
    get 'master/format' => 'master#allformat'

    # account
    get 'account/loginStatus' => 'account#loginStatus'
    get 'account/loginAccount' => 'account#loginAccount'
    post 'account/login' => 'account#login'
    post 'account/logout' => 'account#logout'
  end
end
