class UserNotifier < ApplicationMailer
  default from: "Trevor Knott <tknott95@hotmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.signed_up.subject
  #
  def signed_up(user)
    @user = user
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verified.subject
  #
  def verified(user)
    @user = user
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.verify.subject
  #
  def verify(user)
    @user = user
    mail to: @user.email
  end
end
