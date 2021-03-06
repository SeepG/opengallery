# frozen_string_literal: true

class PurchaseMailer < ApplicationMailer
  def purchase_email
    @user_name = params[:user]
    mail(to: 'testuserapp6@gmail.com', subject: 'Your Purchase Invoice')
  end

  def seller_email
    @user_name = params[:user]
    mail(to: 'testuserapp6@gmail.com', subject: "You've sold an artwork!")
  end
end
