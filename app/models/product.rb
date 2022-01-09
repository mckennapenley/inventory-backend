class Product < ApplicationRecord
  has_and_belongs_to_many :tags

  def add_tags(tag_params)
    tag_params.each do |tag_param|
      tag = Tag.find_or_create_by(category: tag_param)
      self.tags << tag
    end
  end
end
