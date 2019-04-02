class GachaController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @user = User.find(current_user.id)
    
  end 
   
    
  def top

  end

  def about
  end
  
  def stampresult
      @user = User.find(current_user.id)
      if @user.point < 100
        redirect_to "/gacha", notice: 'ポイントが足りないよ！'
      else
        poi = @user.point
        poi = poi-100
        @user.point = poi
        @user.save
      end

    # if User.find(current_user.id)
    
    
    @stampimages = Stampimage.all
    
    rand  = rand(1..100)
    
    case rand
      when 0..30 #レア度1
        @stampimages = @stampimages.where(rate: 1 )
      when 31..50 #レア度2
        @stampimages = @stampimages.where(rate: 2 )
      when 51..66 #レア度3
        @stampimages = @stampimages.where(rate: 3 )
      when 67..80 #レア度4
        @stampimages = @stampimages.where(rate: 4 )
      when 81..93 #レア度5
        @stampimages = @stampimages.where(rate: 5 )
      else #レア度6
        @stampimages = @stampimages.where(rate: 6 )
    end
    
    String @stampgacha = "hazure"
    userstamp = Userstamp.new
    String cnt = 0
    
    while @stampgacha == "hazure" && cnt <= 5
    
    @stampgacha = @stampimages.offset( rand(@stampimages.count) ).first
    
      if Userstamp.find_by(user_id: current_user.id, stamp_id: @stampgacha.id) == nil
        userstamp = Userstamp.create(user_id: current_user.id, stamp_id: @stampgacha.id)
        # @stampgacha = @stampgacha.image.url
      else
        String @stampgacha = "hazure"
        
        cnt = cnt + 1
      end
    
    end
    
    if cnt == 6
        poi = @user.point
        poi = poi+50
        @user.point = poi
        @user.save
    end
    
    return @stampgacha
    
    
    
    
    
    # stampgacha = ["/assets/stampgacha/hengao.png","/assets/stampgacha/akubi_man.png","/assets/stampgacha/bakanisuru.png","/assets/stampgacha/black_man.png","/assets/stampgacha/bodybuilder_woman.png"]
    # ransu = rand(stampgacha.count)
    # @stampgacha = stampgacha[ransu]
    
    #あとは１００ptひく動作とユーザースタンプテーブルに手に入れたスタンプを登録
    
    # return @stampgacha
  end
  
  
  
  def friendresult
    @user = User.find(current_user.id)
      if @user.point < 200
        redirect_to "/gacha", notice: 'ポイントが足りないよ！'
      else
        poi = @user.point
        poi = poi-200
        @user.point = poi
        @user.save
      end
    
    @users = User.all
    # @frid  = Frids.all
   
    @cnt = 0 
    String @frienduser = @users.offset( rand(@users.count) ).first #ユーザをランダムに１件取ってくる
    
    flg = 0
    
    # 後はすでに友達の人が出た時の処理
    while  flg == 0 && @cnt <=5
          while current_user.id == @frienduser.id #自分のユーザ以外が出てくるまでランダムに繰り返す
              String @frienduser = @users.offset( rand(@users.count) ).first
          end
          if Frids.find_by(userid: current_user.id, friendid: @frienduser.id) == nil
              @frid = Frids.new(userid: current_user.id, friendid: @frienduser.id)
              @frid.save
              @frid = Frids.new(userid: @frienduser.id, friendid: current_user.id)
              @frid.save
              flg = 1
          end
          @cnt = @cnt + 1
            
    end
    
    
    if @cnt == 6
        poi = @user.point
        poi = poi+100
        @user.point = poi
        @user.save
    end
    

    return @frienduser
  
  end
  
  
  
  
  def loverresult
    
    @user = User.find(current_user.id)
      if @user.point < 500
        redirect_to "/gacha", notice: 'ポイントが足りないよ！'
      else
        poi = @user.point
        poi = poi-500
        @user.point = poi
        @user.save
      end
    
    @users = User.all
    @user = User.find(current_user.id)
    flg = 0
    @cnt = 0
      if @user.sex == 1 #自分の性別が男
        @lover = User.where(sex: 2)
        
        if @lover.find_by(favorite_type: @user.favorite_type) != nil #好みのタイプいたら
          @lover = @lover.where(favorite_type: @user.favorite_type)
          
          @lover = @lover.offset( rand(@lover.count) ).first
          
          while flg == 0 && @cnt <= 5
            if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
              @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
              @frid.save
              @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
              @frid.save
              @message ="この子タイプやわぁ・・・"
              flg = 1
            else
              @lover = User.where(sex: 2)
              @lover = @lover.offset( rand(@lover.count) ).first
                if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
                  @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
              @frid.save
              @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
              @frid.save
              @message ="この子ちょっと気になるわぁ・・・"
                  flg = 1
                end
              @cnt = @cnt + 1
            end
          end
          
          # @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
          # @frid.save
          # @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
          # @frid.save
          
        else
          # @lover = @lover.offset( rand(@lover.count) ).first
          # if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
          #   @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
          #   @frid.save
          #   @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
          #   @frid.save
          # else
          #   @cnt = 6
          # end
          @message ="このSNSまだ女の子おらんわぁ・・・"
          @cnt = 6
        end
      
      elsif @user.sex == 2 #自分の性別が女
        # @lover = User.find_by(sex: 1)
        @lover = User.where(sex: 1)
        
        if @lover.find_by(favorite_type: @user.favorite_type) != nil
          @lover = @lover.where(favorite_type: @user.favorite_type)
          
          @lover = @lover.offset( rand(@lover.count) ).first
          
          while flg == 0 && @cnt <= 5
            if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
              @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
              @frid.save
              @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
              @frid.save
              @message ="この殿方タイプやわぁ・・・"
              flg = 1
            else
              @lover = User.where(sex: 1)
              @lover = @lover.offset( rand(@lover.count) ).first
                if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
                  @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
          @frid.save
          @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
          @frid.save
          @message ="この殿方ちょっと気になるわぁ・・・"
                  flg = 1
                end
              @cnt = @cnt + 1
            end
          end
          
          # @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
          # @frid.save
          # @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
          # @frid.save
        else
          # @lover = @lover.offset( rand(@lover.count) ).first
          # if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
          #   @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
          #   @frid.save
          #   @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
          #   @frid.save
          # else
          #   @cnt = 6
          # end
          @message ="このSNSまだ素敵な殿方おらんわぁ・・・"
          @cnt = 6
        end
        
      else #自分の性別が未設定
        
        @users = User.all
        @cnt = 0 
          String @lover = @users.offset( rand(@users.count) ).first #ユーザをランダムに１件取ってくる
    
        flg = 0
    
        # 後はすでに友達の人が出た時の処理
          while  flg == 0 && @cnt <=5
              while current_user.id == @lover.id #自分のユーザ以外が出てくるまでランダムに繰り返す
                  String @lover = @users.offset( rand(@users.count) ).first
              end
              if Frids.find_by(userid: current_user.id, friendid: @lover.id) == nil
                  @frid = Frids.new(userid: current_user.id, friendid: @lover.id)
                  @frid.save
                  @frid = Frids.new(userid: @lover.id, friendid: current_user.id)
                  @frid.save
                  flg = 1
              end
              @cnt = @cnt + 1
              
            
          end

        @message ="タイプ設定してくれたらもっと素敵な人紹介できるのになぁ・・・"
        
      end
        
      # p @lover 
      # p"まだいっぱい"
    
      # @lover = @lover.offset( rand(@lover.count) ).first
    
    # String @loveruser = @users.offset( rand(@users.count) ).first #ユーザをランダムに１件取ってくる
    
    # while  current_user.id == @loveruser.id #自分のユーザ以外が出てくるまでランダムに繰り返す
    #     String @loveruser = @users.offset( rand(@users.count) ).first
    # end
    
    
    if @cnt == 6
        poi = @user.point
        poi = poi+100
        @user.point = poi
        @user.save
    end
    
          
    
    @loveruser = @lover
    
    
    
    
    return @loveruser
    
  end
  
  
  
  
  def premiumresult
    
    @users = User.all
   
    @cnt = 0 
    String @frienduser = @users.offset( rand(@users.count) ).first #ユーザをランダムに１件取ってくる
    
    flg = 0
    
    
    while  flg == 0 && @cnt <= 5
          while current_user.id == @frienduser.id #自分のユーザ以外が出てくるまでランダムに繰り返す
              String @frienduser = @users.offset( rand(@users.count) ).first
          end
          if Frids.find_by(userid: current_user.id, friendid: @frienduser.id) == nil
              @frid = Frids.new(userid: current_user.id, friendid: @frienduser.id)
              @frid.save
              @frid = Frids.new(userid: @frienduser.id, friendid: current_user.id)
              @frid.save
              flg = 1
          end
          @cnt = @cnt + 1
            
    end
    
    # 生け贄たちをDELETE!
    $index = 0
    while $checkid.size >= $index do
      Frids.delete_all(["userid = ? AND friendid = ?", current_user.id, $checkid.at($index)])
      Frids.delete_all(["userid = ? AND friendid = ?", $checkid.at($index), current_user.id])
      $index = $index + 1
    end
    
    $checkuser.clear
    $checkid.clear
    
    return @frienduser
    
  end
  
  
  
  
  def show
    
  end
  
  def stampgacha
    @user = User.find(current_user.id)
    if @user.point < 100
      redirect_to "/gacha", notice: 'ポイントが足りないよ！'
    end
    
  end
  
  def friendgacha
    @user = User.find(current_user.id)
    if @user.point < 200
      redirect_to "/gacha", notice: 'ポイントが足りないよ！'
    end
  end
  
  def lovergacha
    @user = User.find(current_user.id)
    if @user.point < 500
      redirect_to "/gacha", notice: 'ポイントが足りないよ！'
    end
  end
  
  def premiumgacha
    
    if !params[:checkid].present?then
      pnew
    end
    
    # 初期化
    $index = 0
    flg = 0
    @user = Array.new
    $checkuser.clear
    
    # ログインしているユーザの全ての友達を取得
    @frid = Frids.where(userid: current_user.id)
    @frid.each do |id|
      @user.push(User.find_by(id: id.friendid))
    end
    
    if params[:checkid].present?  then # premiumgacha.erbからparams[:checkid]を受け取った場合
      @user = Array.new
      
      while $checkid.size > $index do
        if $checkid.at($index).to_s == params[:checkid].to_s then 
          flg = 1
          $checkid.delete_at($index)
        end
        $index = $index + 1
        
      end
      
      # 一度も受け取ったことのない場合
      if flg == 0 then
        $checkid.insert($index,params[:checkid])
      end
      
      # ログインしているユーザの全ての友達を取得
      @frid.each do |id|
        
        # 初期化
        $index = 0
        flg = 0
        
        while $checkid.size > $index do
          if $checkid.at($index).to_s == id.friendid.to_s then
            flg = 1
          end
          $index = $index + 1
        end
          
        if flg == 1 then # 選択されたユーザ
          $checkuser.push(User.find_by(id: id.friendid))
          
        else # 選択されていないユーザ
          @user.push(User.find_by(id: id.friendid))
            
        end
        flg = 0
        
      end
      
    end
  end
  
  def pnew
    # 共有の変数
    $checkid = Array.new
    $checkuser = Array.new
    $checkid.insert(0,0)
  end
  
end
