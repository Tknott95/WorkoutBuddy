class User < ActiveRecord::Base
  has_secure_password


  def needs_verification!
    self.update_attributes!(
          token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver_now
  end
end
