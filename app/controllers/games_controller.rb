


class GamesController < ApplicationController
  before_action :authenticate_user!
  
  
  def index

  end  
    
  def top

  end

  def about
  end
  
  def result
    
    $js = 0
    @point = params[:point]
    poi2 = @point
    poi2 = poi2.to_i
    if poi2 == 0 then
      redirect_to root_path, notice: "残念。また挑戦してね！"
    else
      @user = User.find(current_user.id)
      poi = @user.point
      poi = poi + poi2
      @user.point = poi
      @user.save
      
      
      redirect_to root_path, notice: "#{@point}ポイントゲットしたよ！"
    end
  end
end
