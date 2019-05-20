class Receipt < ApplicationRecord
  has_many :purchases
  belongs_to :user
  enum payment: { 銀行振込:1, クレジットカード:2, 代金引換:3 }
  enum status: { 未発送: 1, 発送済: 2 }


# クラスメソッド 未発送の情報のみ取得
  def self.undispatched
    list = self.select do |receipt|
      receipt.status == '未発送'
    end
    return list
  end


end
