require 'csv'

class Meal < ApplicationRecord
  belongs_to :user

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

  def self.to_csv
    attributes = %w{id eaten_on moment content}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |meal|
        csv << attributes.map{ |attr| meal.send(attr) }
      end
    end
  end
end
