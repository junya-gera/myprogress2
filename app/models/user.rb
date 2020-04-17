class User < ApplicationRecord
  validates :nickname, :email, presence: { message: 'が入力されていません' }
  validates :email, format: {
    with:  /\A\S+@\S+\.\S+\z/, message: "メールアドレスが正しくありません"
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  mount_uploader :image, ImageUploader
  has_many :events
  has_many :sns_credentials
end
