class AddBudgetToAuthorization < ActiveRecord::Migration[7.0]
  def change
    add_reference :authorizations, :budget, null: false, foreign_key: true
  end
end
