class BidAskMailer < ApplicationMailer
  default from: 'noreply.alertwalutowy@gmail.com'

  def send_bid_email(user, currency_name, currency_bid)
    @user = user
    @cname = currency_name
    @cbid = currency_bid
    mail(
      to: @user.email,
      subject: 'Currency reached selected value!'
    )
  end

  def send_ask_email(user, currency_name, currency_bid)
    @user = user
    @cname = currency_name
    @cbid = currency_bid
    mail(
      to: @user.email,
      subject: 'Currency reached selected value!'
    )
  end
end
