FactoryBot.define do
  factory :order_furima do
    postal_code  { "123-4567" }
    product_state_id { 5 }
    city  { "本庄市" }
    block { "本庄市1-1-1" }
    building  { "本庄ビル101" }
    phone_number  { "09012341234" }
    
  end
end