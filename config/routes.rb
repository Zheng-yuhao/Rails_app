Rails.application.routes.draw do
  # get request
  get 'static_pages/home' # => StaticPages#home
  get 'static_pages/help' # => StaticPages#help
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
