class Dog < ApplicationRecord
  belongs_to :user
  has_many :meetings
  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  # validates :description, presence: true
  # validates :name, uniqueness: { scope: :user_id }
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
