class AddNameToBudget < ActiveRecord::Migration[7.0]
  def change
    add_column :budgets, :name, :string
  end
end
