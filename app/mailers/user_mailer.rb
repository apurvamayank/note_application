class UserMailer < ApplicationMailer
  def new_note_email
    @user = params[:user]
    @note = params[:note]
    mail(to: @user.email, subject: "New note @ #{Time.now.strftime('%a, %H:%M')}")
  end
end
