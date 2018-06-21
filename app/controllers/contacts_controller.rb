class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    # @contact.request = request
    ContactMailer.send_signup_email(@contact).deliver_now
  #   if @contact.deliver
  #     flash.now[:error] = nil
  #   else
  #     flash.now[:error] = 'Cannot send message.'
  #     render :new
  # end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
