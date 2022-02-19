class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.timestamps
    end

    create_join_table :budgets, :users
    add_index :budgets_users, %i[budget_id user_id], unique: true, name: 'index_posts_users'
  end
end
