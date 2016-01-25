class ContactsController < ApplicationController
  def index
    render json: Contact.all
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
    @contact.destroy
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
