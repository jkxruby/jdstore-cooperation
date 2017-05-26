class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :recent, -> { order("created_at DESC") }
  belongs_to :category

  has_many :collections
  has_many :members, through: :collections, source: :user

  has_many :reviews, dependent: :destroy
end
