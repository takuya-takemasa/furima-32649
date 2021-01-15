class Item < ApplicationRecord
  has_one_attached :image
  has_one :order
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :product_state
  belongs_to :shipping_number
  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
    
    with_options  numericality: { other_than: 0 }  do
      validates :category_id
      validates :delivery_id
      validates :prefecture_id 
      validates :product_state_id
      validates :shipping_number_id
    end
  end


  

