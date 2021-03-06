class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :shipping_familyname,       null: false
      t.string :shipping_firstname,        null: false
      t.string :shipping_kana_familyname,  null: false
      t.string :shipping_kana_firstname,   null: false
      t.string :shipping_postal,           null: false
      t.string :shipping_address,          null: false
      t.string :shipping_telephone_number, null: false
      t.integer :payment,                  null: false
      t.integer :status,                   null: false
      t.integer :postage,                  null: false
      t.timestamps
    end
  end
end
