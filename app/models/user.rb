class User < ApplicationRecord
  has_many :items
  
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
    
  validates :nickname,:birth_day, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :fast_name
    validates :last_name
  end
   
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
    validates :fast_name_kana
    validates :last_name_kana
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

end


