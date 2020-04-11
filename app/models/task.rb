class Task < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: { message: 'が入力されていません' }
end
