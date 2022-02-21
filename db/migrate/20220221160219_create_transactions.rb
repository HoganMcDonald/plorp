class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.decimal :amount
      t.string :category
      t.datetime :authorized_date
      t.datetime :date
      t.string :transaction_id
      t.string :merchant
      t.string :city

      t.timestamps
    end
  end
end
