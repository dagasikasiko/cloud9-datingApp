class TypeController < ApplicationController
  before_action :authenticate_user!
  

  def index
    
  end

  def show
   
  end

  def new
    
  end

  def edit
   
  end

  def create
    
  end
    
  def choice
  
  end
  
  def question
      
  end
 
 def men
    users = User.find(current_user.id)
    users.update_attribute(:sex, '1')
    # render :json => users
 end
 
 def women
     users = User.find(current_user.id)
    users.update_attribute(:sex, '2')
    # render :json => users
 end
 
 def result
    if request.post? then
      # @msg = "typed:" + params['s1']
      @gokei = params['s1'].to_i + params['s2'].to_i + params['s3'].to_i + params['s4'].to_i
      
      if @gokei <= 7 
        # @moji="ぱーりーぴーぽー"
        users = User.find(current_user.id)
        users.update_attribute(:favorite_type, '1')
      elsif @gokei >=8 && @gokei <= 13
        # @moji="ほんわかおっとりタイプ"
        users = User.find(current_user.id)
        users.update_attribute(:favorite_type, '2')
      elsif @gokei >=14 && @gokei <= 19
        # @moji="くーるびゅーてぃー"
        users = User.find(current_user.id)
        users.update_attribute(:favorite_type, '3')
      else
        # @moji="みすてりあす"
        users = User.find(current_user.id)
        users.update_attribute(:favorite_type, '4')
      end
      
      redirect_to "/", notice: 'タイプ変更したよ！マイページから再設定可能です。'
      
      
    else
      @msg = "データはいってないよぉ！"
    end
  # @erea = params[:page][:area]
  # @furu = params[:page][:fruit]
 end
    
    
end
