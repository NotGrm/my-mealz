class AddUserToMeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :meals, :user, foreign_key: true
  end
end
