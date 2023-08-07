class CreateJoinTablePlotsPlants < ActiveRecord::Migration[7.0]
  def change
    create_join_table :plots, :plants do |t|
      t.index [:plot_id, :plant_id]
      t.index [:plant_id, :plot_id]
    end
  end
end
