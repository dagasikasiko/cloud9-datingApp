class HomeController < ApplicationController
  
  # layout false
  
  def top
    if user_signed_in?
      @note = Note.new
      @notes = Note.all.order(created_at: :desc)


      
      @user = User.find_by(id: current_user.id)
      
      # p"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

      # p current_user.id
      
      
    end
  end

  def about
    
    
  end

  

  
end
