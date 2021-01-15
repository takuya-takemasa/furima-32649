class StreetAddress < ApplicationRecord
  belongs_to :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_state
end
