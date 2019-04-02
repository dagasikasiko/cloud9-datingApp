class Admin::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate
  
    include ApplicationHelper
  layout 'admin/dashboard'
  # GET /admin/notes
  # GET /admin/notes.json
  def index
    @note = Note.all.order(created_at: :desc)
  end

  # GET /admin/notes/1
  # GET /admin/notes/1.json
  def show
  end

  # GET /admin/notes/new
  def new
    @note = Note.new
  end

  # GET /admin/notes/1/edit
  def edit
  end

  # POST /admin/notes
  # POST /admin/notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/notes/1
  # PATCH/PUT /admin/notes/1.json
  def update
    if @note.update(note_params)
      redirect_to "/admin/notes", notice: "admin_ポエートが更新されました"
    else
      render :edit
    end
  end

  # DELETE /admin/notes/1
  # DELETE /admin/notes/1.json
  def destroy
    @note.destroy
    redirect_to "/admin/notes", notice: "admin_ポエートが削除されました"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Admin
    def note_params
      params.require(:note).permit(:title, :content, :user_id)
      # params.fetch(@note, {}).permit(:title, :content)
    end
    
     def authenticate
      if request.referer.nil? then
        redirect_to root_path
      end
      end
end
