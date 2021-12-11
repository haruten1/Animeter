class CreateMyanimes < ActiveRecord::Migration[6.1]
  def change
    create_table :myanimes do |t|
      t.integer :user_id
      t.integer :anime_id
      t.integer :rank

      t.timestamps
    end
  end
end
