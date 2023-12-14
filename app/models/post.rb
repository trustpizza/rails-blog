class Post < ApplicationRecord
  belongs_to :author

  has_many :post_elements, -> { order(position: :asc) }
  has_one_attached :header_image
end
