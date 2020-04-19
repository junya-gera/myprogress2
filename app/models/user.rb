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
  has_many :puzzles

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end


end
