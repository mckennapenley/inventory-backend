class Product < ApplicationRecord
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates_length_of :title, minimum: 1, maximum: 50, allow_blank: false
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  

  def add_tags(tag_params)
    tag_params.each do |tag_param|
      tag = Tag.find_or_create_by(category: tag_param)
      self.tags << tag
    end
  end
end
