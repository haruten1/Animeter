class AddMaileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mail, :string
  end
end
