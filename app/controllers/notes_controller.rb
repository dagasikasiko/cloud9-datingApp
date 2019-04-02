class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  include ApplicationHelper
  
  # @keywords = WordScoop.new(["Ruby", "Rails", "飯野", "好き", "出会い"])
  # @keywords << "出会い系"
  # p @keywords.search("Ruby 好き")
  
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @note = Note.new

    
  end

  def create
    @note = current_user.notes.build(note_params)
    

    # @jisho = @keywords.search(@note.content)
    # p @jisho
    
    home = $home.search(@note.content)
    
    poi1 = home.length*100
    
    
    dame = $dame.search(@note.content)
   
    poi2 = dame.length*50
    
    if @note.save
        @user = User.find(current_user.id)
        poi = @user.point
        poi = poi+poi1-poi2
        hantei = poi1-poi2
        if hantei >= 1000
          redirect_to root_path, notice: "不正スンナ！"
        elsif hantei > 0
          redirect_to root_path, notice: "素敵なポエートですね！ガチャptプレゼント！"
          @user.point = poi
          @user.save
        elsif hantei == 0
          redirect_to root_path, notice: "ちゃんと投稿できたよ！"
        elsif hantei >= -1000
          redirect_to root_path, notice: "もっと明るいポエムが聞きたいな。。ネガティブポエムはガチャpt減点！"
          @user.point = poi
          @user.save
        else
          redirect_to root_path, notice: "無理しないでね"
          
        end
        
        
      # redirect_to root_path, notice: "正常にポエートできました"
      
    else
      render :new
    end
    
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to "/", notice: "ポエートが更新されました"
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to "/", notice: "ポエートが削除されました"
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end

    def correct_user
      note = Note.find(params[:id])
      if !current_user?(note.user)
        redirect_to root_path
      end
    end
end
