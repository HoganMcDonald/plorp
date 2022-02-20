class CreateSpendingPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :spending_plans do |t|
      t.references :budget, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.decimal :limit

      t.timestamps
    end
  end
end
