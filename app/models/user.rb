class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:instagram]
  has_many :fights, dependent: :destroy
  has_one :insta_user, dependent: :destroy

  def username
    if self.insta_user
      insta_user.username
    else
      "Unknown"
    end
  end

  def self.find_for_instagram_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:email] = auth.info.nickname + "@example.com"
    user_params[:instagram_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.nickname + "@example.com").first # User did a regular sign up in the past.

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save

    end

    return user
  end

end


