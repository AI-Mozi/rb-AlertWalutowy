class BidAskMailer < ApplicationMailer
  default :from => 'noreply.alertwalutowy@gmail.com'

  def send_bid_ask_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Currency reached selected value')
  end
end
