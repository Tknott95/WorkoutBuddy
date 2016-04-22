class User < ActiveRecord::Base
  has_secure_password

  has_one :profile
  before_create :build_profile #Creates profile at user registration

  def needs_verification!
    self.update_attributes!(
          token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver_now
  end
end
