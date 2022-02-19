class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :plaid_id
      t.string :account_type
      t.integer :account_sub_type
      t.decimal :balance
      t.decimal :limit
      t.references :authorization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
