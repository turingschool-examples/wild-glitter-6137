class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :days_to_harvest
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
