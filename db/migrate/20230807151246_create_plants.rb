class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.string :days_to_harvest

      t.timestamps
    end
  end
end
