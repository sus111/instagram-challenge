class User < ApplicationRecord
  has_many :comments,
  -> { extending WithUserAssociationExtension }
  has_many :pictures, -> { extending WithUserAssociationExtension }
  has_many :likes, -> { extending WithUserAssociationExtension }
  has_many :liked_pictures, through: :likes, source: :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def has_liked?(picture)
    liked_pictures.include? picture
  end

attr_accessor :login
attr_accessor :username
         def self.from_omniauth(auth)
           where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
           end
         end

         def self.new_with_session(params, session)
           super.tap do |user|
             if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
               user.email = data["email"] if user.email.blank?
             end
           end
         end

end
