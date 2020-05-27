class Dog < ApplicationRecord
  belongs_to :user
  has_many :meetings

  validates :name, presence: true
  # validates :address, presence: true
  # validates :description, presence: true
  # validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
end
