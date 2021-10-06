Rails.application.routes.draw do

  # get request
  get 'static_pages/home' # => StaticPages#home
  get 'static_pages/help' # => StaticPages#help
  get 'static_pages/about'
  get 'static_pages/contact'
  
  get '/help', to: 'static_pages#help' # 不用再写static_pages访问网页了
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  get '/signup', to: 'users#new'
  
  
  root 'static_pages#home'
end
