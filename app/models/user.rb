class User < ApplicationRecord
  validates :nickname, :email, presence: { message: 'が入力されていません' }
  validates :email, format: {
    with:  /\A\S+@\S+\.\S+\z/, message: "メールアドレスが正しくありません"
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

end
