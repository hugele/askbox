class Ask < ApplicationRecord
  validates :title,    presence: true
  validates :text,    presence: true
  belongs_to :user
  has_many :comments,dependent: :destroy
  validates :title,
    length: { minimum: 1, maximum: 30 }
end
