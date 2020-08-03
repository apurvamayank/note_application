class NotesController < ApplicationController
  before_action :require_login
  before_action :find_note, only: [:show, :update, :destroy, :edit]
  def index
    @notes = current_user.notes
  end

  def new
    @note = current_user.notes.new
  end

  def edit; end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      UserMailer.with(user: current_user, note: @note).new_note_email.deliver_later
      redirect_to notes_path, notice: 'Note created'
    else
      render :new
    end
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note update'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @note.destroy
      redirect_to notes_path, notice: 'Note deleted'
    else
      redirect_to notes_path, notice: 'Error deleting note'
    end
  end

  private

  def find_note
    @note = current_user.notes.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
