class PostElement < ApplicationRecord
  belongs_to :post

  acts_as_list scope: :post

  validates :element_type, inclusion: { in: [ 'paragraph', 'image', 'video-embed' ]}

  has_rich_text :content
  has_one_attached :image

  def paragraph?
    element_type == "paragraph"
  end

  def image?
    element_type == "image"
  end

  def video?
    element_type == "video-embed"
  end
end
