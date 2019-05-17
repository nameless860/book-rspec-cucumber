class Book < ApplicationRecord
  belongs_to :author

  scope :inactive, -> { where(active: false) }
  validates :title, presence: true
  validates :description, presence: true
end
