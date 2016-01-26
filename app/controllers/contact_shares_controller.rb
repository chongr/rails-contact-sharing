class ContactSharesController < ApplicationController
  def create
    created = ContactShare.new(contact_shares_params)

    if created.save
      render json: created
    else
      render json: created.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    found = ContactShare.find(params[:id])
    found.destroy!
    render json: found
  end

  private
  def contact_shares_params
    params[:contact_share].permit(:user_id, :contact_id)
  end
end
