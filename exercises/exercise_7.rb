require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :store_id, presence: true
  validates :hourly_rate, numericality: { greater_than: 40, less_than: 200 }
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :must_carry_atleast_mens_or_womens

  def must_carry_atleast_mens_or_womens
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "Stores must carry at least one of the men's or women's apparel")
    end
  end

end

puts "enter a name for new store"
newstorename = gets.chomp
store = Store.create(name: newstorename)
puts Store.create.errors[:name]
puts Store.create.errors[:annual_revenue]
puts Store.create.errors[:mens_apparel]