class Admin::HomeController < ApplicationController
    before_action :authenticate
    
    layout 'admin/dashboard'
  def top
  end
  
  
  private
    def authenticate
      if request.referer.nil? then
        redirect_to root_path
      end
    end
    
    def delete
      session[:hoge] = {}
      redirect_to root_path
    end
end
