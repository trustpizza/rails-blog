class Element < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: [ "paragraph" ]}

  has_rich_text :content
end
