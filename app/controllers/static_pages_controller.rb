class StaticPagesController < ApplicationController
  def home
    # => "app/views/#{resource name}/@{action name}.html.erb"
  end

  def help
  end
  
  def about
    # => app/views/static-pages/about.html.erb 不存在所以test失败
  end
end
