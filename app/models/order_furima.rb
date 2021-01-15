class OrderFurima
  include ActiveModel::Model
   attr_accessor :postal_code, :product_state_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを挟んだ半角数字で入力してください' }
    validates :product_state_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city         # 市区町村
    validates :block            # 番地 -->
    validates :token
    validates :user_id
    validates :item_id
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }, length: { maximum: 11 }
  end
  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, product_state_id: product_state_id , city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end