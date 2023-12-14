class Post < ApplicationRecord
  # Friendly IDs to look better than posts/1
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  belongs_to :author

  has_many :post_elements, -> { order(position: :asc) }, dependent: :destroy
  has_one_attached :header_image

  validates :title, presence: true, length: {minimum: 10}
  validates :description, presence: true, length: { in: 50..250 }

  scope :published, -> do
    where(published: true)
  end

  scope :most_recently_published, -> do
    order(published_at: :desc)
  end


  def should_generate_new_friendly_id?
    title_changed?
  end
end
