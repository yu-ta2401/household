class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to_active_hash :category

  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :category_id
    validates :price, :numericality => { :greater_than_or_equal_to => 300 }
    validates :price, :numericality => { :less_than_or_equal_to => 9999999 }
    validates :category_id, numericality: { other_than: 1 }
  end

  def image_presence
    self.image.attached?
  end 
end
