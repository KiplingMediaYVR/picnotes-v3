class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.order('created_at DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :description, :image)
  end

  def find_note
    @note = Note.find params[:id]
  end
end
