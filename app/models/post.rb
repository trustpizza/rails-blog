class Post < ApplicationRecord
  # Friendly IDs to look better than posts/1
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  has_many :post_elements, -> { order(position: :asc) }, dependent: :destroy
  has_one_attached :header_image

  validates :title, presence: true, length: {minimum: 10}
  validates :description, presence: true, length: { in: 50..250 }
end
