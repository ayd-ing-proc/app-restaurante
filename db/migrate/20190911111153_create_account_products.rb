class CreateAccountProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :account_products do |t|
      t.references :product, foreign_key: true
      t.references :account, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
