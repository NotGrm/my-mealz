class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.date :eaten_on
      t.text :content
      t.string :moment

      t.timestamps
    end
  end
end
