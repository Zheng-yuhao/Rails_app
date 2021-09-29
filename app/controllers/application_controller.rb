class ApplicationController < ActionController::Base
  def hello
    render html: "hello, owrld"
  end
end
