class CreateAuthorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :authorizations do |t|
      t.string :access_token
      t.string :name

      t.timestamps
    end
  end
end
