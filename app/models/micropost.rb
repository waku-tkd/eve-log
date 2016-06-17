class Micropost < ActiveRecord::Base
  validates :title, presence: true, length:{ maximum: 100 }
  validates :location, presence: true, length:{ maximum: 100 }
  validates :headcount, presence: true, numericality:{ only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2000 }
  validates :budget, presence: true, numericality:{ only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 9999999 }
end
