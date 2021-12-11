class AddYearSeasonToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :year, :int
    add_column :works, :season, :int
  end
end
