class Meal < ApplicationRecord
  enum moment: {
    breakfast: 'breakfast',
    morning_snack: 'morning_snack',
    lunch: 'lunch',
    afternoon_snack: 'afternoon_snack',
    dinner: 'dinner'
  }

  validates :eaten_on, presence: true
  validates :moment, presence: true, uniqueness: { scope: :eaten_on, message: 'you already declared a meal for that moment' }
  validates :content, presence: true
end
