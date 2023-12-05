class PostElement < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: [ 'paragraph', 'image', 'video-embed' ]}

  has_rich_text :content

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
