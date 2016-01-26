class ContactsController < ApplicationController
  def index
    # @contact = Contact.find(params[:user_id])
    @user = User.find(params[:user_id])
    all_contacts = @user.contacts.concat(@user.shared_contacts)
    render json: all_contacts
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy!
    render json: @contact
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :not_found
    end
  end

  def update
    @contact = Contact.new(contact_params)

    if @contact.update
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params[:contact].permit(:email,:name)
  end
end
