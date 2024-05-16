class Element < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: [ "paragraph", "image" ]}

  has_rich_text :content
  has_one_attached :image

  acts_as_list

  default_scope {order(:position)}
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
