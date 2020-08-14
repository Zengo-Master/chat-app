class Room < ApplicationRecord
  has_many :room_users
  # roomが削除されるとuserも削除される
  has_many :users, through: :room_users, dependent: :destroy
  # roomが削除れるとmessageも削除される
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end