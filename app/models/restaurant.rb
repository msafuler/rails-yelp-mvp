class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true
  validates :category, inclusion: {
    in: %w[chinese italian japanese french belgian],
    message: '%<value>s is not a valid category'
  }
  has_many :reviews, dependent: :destroy
end
