class Tag < ApplicationRecord
  has_and_belongs_to_many :products

  validates :category, presence: true
end
