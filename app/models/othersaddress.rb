class Othersaddress < ApplicationRecord

  belongs_to :user

  validates :familyname, presence: true
  validates :firstname, presence: true
  validates :kana_familyname, presence: true
  validates :kana_firstname, presence: true


 # 郵便番号の仮想カラム
   attr_accessor :first_postal_code, :last_postal_code

  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :first_postal_code, :last_postal_code, presence: true

  #先にset_postal_codeを呼ばないとバリデーションエラーになる
  before_validation :set_postal_code

  def first_postal_code
    @first_postal_code || self.postal_code[0..2] if self.postal_code.present?
  end

  def last_postal_code
    @last_postal_code || self.postal_code[3..6] if self.postal_code.present?
  end

  #DBカラムはpostal_codeのため、バリデーション前に結合して設定する
  def set_postal_code
    self.postal_code = [@first_postal_code, @last_postal_code].join
  end

  # 住所の仮想カラム
  attr_accessor :statu_address, :city_address, :street_address

  validates :statu_address, :city_address, presence: true

  #
  before_validation :set_address

  def statu_address
    @statu_address if self.address.present?
  end

  def city_address
    @city_address if self.address.present?
  end

  def street_address
    @street_address if self.address.present?
  end

  #
  def set_address
    self.address = [@statu_address, @city_address, @street_address].join
  end


  # 電話番号の仮想カラム
  attr_accessor :telephone_number1, :telephone_number2, :telephone_number3

  validates :telephone_number, format: { with: /\A\d{11}\z/ }
  validates :telephone_number1, :telephone_number2, :telephone_number3, presence: true

  #
  before_validation :set_telephone_number

  def telephone_number1
    @telephone_number1 || self.telephone_number[0..2] if self.telephone_number.present?
  end

  def telephone_number2
    @telephone_number2 || self.telephone_number[3..6] if self.telephone_number.present?
  end

  def telephone_number3
    @telephone_number3 || self.telephone_number[7..10] if self.telephone_number.present?
  end

  #
  def set_telephone_number
    self.telephone_number = [@telephone_number1, @telephone_number2, @telephone_number3].join
  end
end
