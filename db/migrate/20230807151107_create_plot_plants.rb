class CreatePlotPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plot_plants do |t|
      t.references :plots, null: false, foreign_key: true
      t.references :plants, null: false, foreign_key: true

      t.timestamps
    end
  end
end
