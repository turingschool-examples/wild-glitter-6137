class CreateJoinTablePlantsPlots < ActiveRecord::Migration[6.0]
  def change
    create_join_table :plants, :plots do |t|
      t.index [:plant_id, :plot_id]
      t.index [:plot_id, :plant_id]
    end
  end
end