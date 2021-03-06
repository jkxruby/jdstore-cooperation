class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :recent, -> { order("created_at DESC") }
  belongs_to :category

 # 收藏
  has_many :collections
  has_many :members, through: :collections, source: :user


  has_many :reviews, dependent: :destroy

  # 多图
  has_many :photos
  accepts_nested_attributes_for :photos  

end
